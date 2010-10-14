#import <Foundation/Foundation.h>
#import "utils.h"
#import "T2TSnippetConverterShared.h"
#import "T2TSnippetConverterLexer.h"

int main (int argc, const char * argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *pathToBundle;
	NSString *outputPath;
	
	//NSString *output = T2TConvertTextMateSnippetToChocolat(@"test!");
	//NSLog(@"Main Output: %@", output);
    //return 0;
	// Very thorough argument checking...
	if(argc != 3) {
		NSLog(@"Only 2 argument are required, the input path...and output path kthxbye");
		return 1;
	}
	pathToBundle	= [NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
	outputPath		= [NSString stringWithCString:argv[2] encoding:NSASCIIStringEncoding];
	
	// Does that path exist?
	if(![[NSFileManager defaultManager] fileExistsAtPath:pathToBundle]) {
		NSLog(@"That bundle does not exist!");
		return 1;
	}
	// create output dir
	if(!createOutputDir(outputPath)) {
		NSLog(@"Could not create directories! Bailing...");
		return 1;
	}
	
	if(!importMetaData(pathToBundle, outputPath)) {
		return 1;
	}
	
	
	copyResources(pathToBundle, outputPath);
	importLanguages(pathToBundle, outputPath);
	importCommands(pathToBundle, outputPath);
	importTemplates(pathToBundle, outputPath);
	// Good! Do something with it!
	importSnippets(pathToBundle, outputPath);
	[pool release];
    return 0;
}
