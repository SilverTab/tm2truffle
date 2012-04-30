#import <Foundation/Foundation.h>
#import "utils.h"
#import "themeutils.h"

#import "T2TKeyEquivalentConverter.h"
#import "T2TSnippetConverterShared.h"

int main (int argc, const char * argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *pathToBundle;
	NSString *outputPath;
	
	//NSLog(@"Key equiv: `%@`", T2TConvertKeyEquivalent([NSString stringWithFormat:@"$~%C", 0x0003]));
	//return 0;
    /*
    NSString *output = T2TConvertTextMateSnippetToChocolat(@"def ${1:fname}(${2:`if [ \"$TM_CURRENT_LINE\" != \"\" ]\
# poor man's way ... check if there is an indent or not\
# (cuz we would have lost the class scope by this point)\
then\
echo \"self\"\
fi`}):\
${3/.+/\"\"\"/}${3:docstring for $1}${3/.+/\"\"\"\n/}${3/.+/\t/}${0:pass}");
    */
//    output = T2TConvertTextMateSnippetToChocolat(@"Dir[${1:\"${2:glob/**/*.rb}\"}]");
    
    // flunk`snippet_paren.rb`"${1:Failure message.}"`snippet_paren.rb end`$0
    //output = T2TConvertTextMateSnippetToChocolat(@"flunk`snippet_paren.rb`\"${1:Failure message.}\"`snippet_paren.rb end`$0");
//    NSLog(@"Main Output: %@", output);

    
    //	NSString *output = T2TConvertTextMateSnippetToChocolat(@"<head>\n	${1:`abc`}<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"${TM_XHTML}>\n	<title>${1:${TM_FILENAME/((.+)\\..*)?/(?2:$2:Page Title)/}}</title>\n	$0\n</head>");//@"foo${1:${2}baz$3}bar!");
//	NSLog(@"Main Output: %@", output);
//    return 0;
	// Very thorough argument checking...


	if(argc != 3) {
		NSLog(@"Only 2 argument are required, the input path...and output path kthxbye");
		return 1;
	}


	pathToBundle	= //@"/Users/alexgordon/chocolat_truffles/tm_bundles/html.tmbundle";
		[NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
	outputPath		= //@"/Users/alexgordon/chocolat_truffles/Truffles_test/html.truffle";
		[NSString stringWithCString:argv[2] encoding:NSASCIIStringEncoding];
	
	// Does that path exist?
	if(![[NSFileManager defaultManager] fileExistsAtPath:pathToBundle]) {
		NSLog(@"That bundle does not exist!");
		return 1;
	}
	
	if([[[pathToBundle pathExtension] lowercaseString] isEqual:@"tmbundle"]) {
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
		importDragCommands(pathToBundle, outputPath);
		importMacros(pathToBundle, outputPath);
		importTemplates(pathToBundle, outputPath);
		//processIq(pathToBundle, outputPath);
		// Good! Do something with it!
		importSnippets(pathToBundle, outputPath);
		
		importMetaData_menus(pathToBundle, outputPath);
		
	} else if([[[pathToBundle pathExtension] lowercaseString] isEqual:@"tmtheme"]) {
		importTheme(pathToBundle, outputPath);
		
		
	} else {
		NSLog(@"Dude this is for bundles or themes... don't try to open random files with it..wtf man.. not cool");
        return 1;
    }
	
	
	[pool release];
    return 0;
}
