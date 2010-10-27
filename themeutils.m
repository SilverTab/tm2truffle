#import "themeutils.h"
#import <self-ml/SFONode.h>


void importDefaultZone(NSDictionary *zone, SFONode **rootNode) 
{
	SFONode *defaultNode = SELFML(@"!default");
	if([zone objectForKey:@"background"] != nil) {
		SFONode *backgroundNode = SELFML(@"background", [[zone objectForKey:@"background"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:backgroundNode];
	}
	
	if([zone objectForKey:@"foreground"] != nil) {
		SFONode *foregroundNode = SELFML(@"color", [[zone objectForKey:@"foreground"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:foregroundNode];
	}
	
	if([zone objectForKey:@"caret"] != nil) {
		SFONode *caretNode = SELFML(@"caret", [[zone objectForKey:@"caret"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:caretNode];
	}
	
	if([zone objectForKey:@"invisibles"] != nil) {
		SFONode *invisiblesNode = SELFML(@"invisibles", [[zone objectForKey:@"invisibles"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:invisiblesNode];
	}
	
	if([zone objectForKey:@"selection"] != nil) {
		SFONode *selectionNode = SELFML(@"selection", [[zone objectForKey:@"selection"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:selectionNode];
	}
	
	if([zone objectForKey:@"lineHighlight"] != nil) {
		SFONode *lineHighlightNode = SELFML(@"line-highlight", [[zone objectForKey:@"lineHighlight"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[defaultNode addChild:lineHighlightNode];
	}
	
	[*rootNode addChild:defaultNode];
}

void importRegularZone(NSDictionary *zone, SFONode **rootNode) 
{
	if([zone objectForKey:@"name"] == nil || [zone objectForKey:@"scope"] == nil)
		return;
	
	SFONode *zoneNode = SELFML(@"apply", [zone objectForKey:@"scope"], [zone objectForKey:@"name"]);
	NSDictionary *settings = [zone objectForKey:@"settings"];
	
	// foreground
	if([settings objectForKey:@"foreground"] != nil) {
		SFONode *fgNode = SELFML(@"color", [[settings objectForKey:@"foreground"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[zoneNode addChild:fgNode];
	}
	
	// bg
	if([settings objectForKey:@"background"] != nil) {
		SFONode *bgNode = SELFML(@"background", [[settings objectForKey:@"background"] stringByReplacingOccurrencesOfString:@"#" withString:@""]);
		[zoneNode addChild:bgNode];
	}
	
	// styles
	if([settings objectForKey:@"fontStyle"] != nil) {
		NSString *styles = [settings objectForKey:@"fontStyle"];
		if([styles rangeOfString:@"italic"].location != NSNotFound) {
			SFONode *italicNode = SELFML(@"italic");
			[zoneNode addChild:italicNode];
		}
		
		if([styles rangeOfString:@"bold"].location != NSNotFound) {
			SFONode *boldNode = SELFML(@"bold");
			[zoneNode addChild:boldNode];
		}
		
		if([styles rangeOfString:@"underline"].location != NSNotFound) {
			SFONode *underlineNode = SELFML(@"underline");
			[zoneNode addChild:underlineNode];
		}
	}
	
	[*rootNode addChild:zoneNode];
}

int importTheme(NSString *themeRoot, NSString *outputFile) 
{
	// Open the theme!
	NSDictionary *themeDic = [NSPropertyListSerialization propertyListWithData:[NSData dataWithContentsOfFile:themeRoot] 
																	   options:0 
																		format:nil 
																		 error:nil];
	SFONode *rootNode = [SFONode node];
	
	if([themeDic objectForKey:@"name"] != nil) {
		SFONode *nameNode = SELFML(@"name", [themeDic objectForKey:@"name"]);
		[rootNode addChild:nameNode];
	}
	
	if([themeDic objectForKey:@"author"] != nil) {
		SFONode *nameNode = SELFML(@"author", [themeDic objectForKey:@"author"]);
		[rootNode addChild:nameNode];
	}
	
	int i = 0;
	for(NSDictionary *zone in [themeDic objectForKey:@"settings"]) {
		NSDictionary *settings = [zone valueForKey:@"settings"];
		if(i == 0) {
			// root zone
			importDefaultZone(settings, &rootNode);
		} else {
			// regular zone
			importRegularZone(zone, &rootNode);
		}
		
		i++;
		
		
	}
	[[rootNode selfmlRepresentation] writeToFile:outputFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
	//NSLog(@"%@", [rootNode selfmlRepresentation]);
}