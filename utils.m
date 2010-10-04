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
		
		//NSLog(@"Zone: %@", [nodePattern selfmlRepresentation]);
		[rootNode addChild:nodePattern];
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
		if([[[language pathExtension] lowercaseString] isEqual:@"tmlanguage"]) {
			processLanguage([syntaxInPath stringByAppendingPathComponent:language]);
		}
	}
	
}



