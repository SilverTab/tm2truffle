#import "utils.h"
#import <self-ml/SFONode.h>

int createOutputDir(NSString *outputFile) 
{
	NSError *error;
	[[NSFileManager defaultManager] createDirectoryAtPath:outputFile 
							  withIntermediateDirectories:YES 
											   attributes:nil 
													error:&error];
	if(error) {
		NSLog(@"%@", [error localizedDescription]);
		return 0;
	}
	
	return 1;
}


void processSnippet(NSString *snippetPath)
{
	NSDictionary *snippetAsDic = [NSDictionary dictionaryWithContentsOfFile:snippetPath];
	NSLog(@"%@", [snippetAsDic valueForKey:@"name"]);
}

void importSnippets(NSString *bundleRoot, NSString *outputFile)
{
	NSString *snippetsPath = [bundleRoot stringByAppendingPathComponent:@"snippets"];
	NSMutableArray *snippets = [[NSMutableArray alloc] init];
	if(![[NSFileManager defaultManager] fileExistsAtPath:snippetsPath]) {
		NSLog(@"No snippets to import...continuing...");
		return;
	}
	// create the snippet directory...
	[[NSFileManager defaultManager] createDirectoryAtPath:[outputFile stringByAppendingPathComponent:@"snippets"]
							  withIntermediateDirectories:YES 
											   attributes:nil 
													error:nil];
	
	for(NSString *snippet in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:snippetsPath error:nil]) {
		if([[[snippet pathExtension] lowercaseString] isEqual:@"tmsnippet"] || [[[snippet pathExtension] lowercaseString] isEqual:@"plist"]) {
			[snippets addObject:snippet];
		}
	}
	
	for(NSString *snippet in snippets) {
		processSnippet([snippetsPath stringByAppendingPathComponent:snippet]);
	}
	
}

void processPattern(NSDictionary *pattern, SFONode **rootNode) {
	SFONode *nodePattern;
	if([pattern objectForKey:@"name"] != nil) {
		nodePattern = SELFML(@"zone", [pattern objectForKey:@"name"]);
	} else {
		nodePattern = SELFML(@"zone");
		if([pattern objectForKey:@"contentName"] != nil) {
			SFONode *innerIdentifier = SELFML(@"innerIdentifier", [pattern objectForKey:@"contentName"]);
			[nodePattern addChild:innerIdentifier];
		}
	}
	// match
	if([pattern objectForKey:@"match"] != nil) {
		SFONode *regexNode = SELFML(@"regex", [pattern objectForKey:@"match"]);
		SFONode *matchNode = SELFML(@"match");
		[matchNode addChild:regexNode];
		
		if([pattern objectForKey:@"captures"] != nil) {
			NSDictionary *captureDic = [pattern objectForKey:@"captures"];
			
			if([captureDic objectForKey:@"contentName"] != nil){
				[matchNode addChild:(NSString *)[captureDic objectForKey:@"contentName"]];
			} 			
			for(NSString *akey in [captureDic allKeys]) {
				if([akey intValue] || [akey isEqual:@"0"] || [akey isEqual:[NSNumber numberWithInt:0]]) {
					SFONode *captureNode = SELFML(akey, [[captureDic valueForKey:akey] valueForKey:@"name"]);
					[regexNode addChild:captureNode];
				}
			}
		}
		
		[nodePattern addChild:matchNode];
	}
	if([pattern objectForKey:@"begin"] != nil) {
		SFONode *regexNode = SELFML(@"regex", [pattern objectForKey:@"begin"]);
		SFONode *startNode = SELFML(@"start");
		// come up with the name
		
		[startNode addChild:regexNode];
		
		if([pattern objectForKey:@"beginCaptures"] != nil) {
			NSDictionary *beginCaptureDic = [pattern objectForKey:@"beginCaptures"];
			
			if([beginCaptureDic objectForKey:@"contentName"] != nil){
				[startNode addChild:(NSString *)[beginCaptureDic objectForKey:@"contentName"]];
			} 			
			for(NSString *akey in [beginCaptureDic allKeys]) {
				if([akey intValue] || [akey isEqual:@"0"] || [akey isEqual:[NSNumber numberWithInt:0]]) {
					SFONode *captureNode = SELFML(akey, [[beginCaptureDic valueForKey:akey] valueForKey:@"name"]);
					[regexNode addChild:captureNode];
				}
			}
		}
		
		[nodePattern addChild:startNode];
	}
	if([pattern objectForKey:@"end"] != nil) {
		SFONode *regexNode = SELFML(@"regex", [pattern objectForKey:@"end"]);
		SFONode *endNode = SELFML(@"end");
		[endNode addChild:regexNode];
		
		if([pattern objectForKey:@"endCaptures"] != nil) {
			NSDictionary *endCaptureDic = [pattern objectForKey:@"endCaptures"];
			
			if([endCaptureDic objectForKey:@"contentName"] != nil){
				[endNode addChild:(NSString *)[endCaptureDic objectForKey:@"contentName"]];
			} 			
			for(NSString *akey in [endCaptureDic allKeys]) {
				if([akey intValue] || [akey isEqual:@"0"] || [akey isEqual:[NSNumber numberWithInt:0]]) {
					SFONode *captureNode = SELFML(akey, [[endCaptureDic valueForKey:akey] valueForKey:@"name"]);
					[regexNode addChild:captureNode];
				}
			}
		}
		
		[nodePattern addChild:endNode];
	}
	
	
	//NSLog(@"Zone: %@", [nodePattern selfmlRepresentation]);
	[*rootNode addChild:nodePattern];
}

void processLanguage(NSString *languagePath)
{
	NSLog(@"Language: %@", languagePath);
	NSDictionary *languageAsDic = [NSDictionary dictionaryWithContentsOfFile:languagePath];
	NSString *outputDirName = [[languageAsDic valueForKey:@"scopeName"] stringByReplacingOccurrencesOfString:@"source." withString:@""];
	
	SFONode *rootNode = [SFONode node];
	[rootNode setHead:@"root"];
	
	// patterns...
	for(NSDictionary *pattern in [languageAsDic valueForKey:@"patterns"])
	{
		processPattern(pattern, &rootNode);
	}
	
	
	NSLog(@"Out: %@", [rootNode selfmlRepresentation]);
}

void importLanguages(NSString *bundleRoot, NSString *outputFile)
{
	NSString *syntaxInPath = [bundleRoot stringByAppendingPathComponent:@"Syntaxes"];
	NSString *syntaxOutPath = [outputFile stringByAppendingPathComponent:@"languages"];

	
	// create the languages directory...
	[[NSFileManager defaultManager] createDirectoryAtPath:syntaxOutPath
							  withIntermediateDirectories:YES 
											   attributes:nil 
													error:nil];
	
	for(NSString *language in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:syntaxInPath error:nil]) {
		if([[[language pathExtension] lowercaseString] isEqual:@"tmlanguage"] || [[[language pathExtension] lowercaseString] isEqual:@"plist"]) {
			processLanguage([syntaxInPath stringByAppendingPathComponent:language]);
		}
	}
	
}



