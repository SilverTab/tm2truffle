#import <Foundation/Foundation.h>

void importSnippets(NSString *bundleRoot, NSString *outputFile);
void importLanguages(NSString *bundleRoot, NSString *outputFile);
void copyResources(NSString *bundleRoot, NSString *outputFile);
int importMetaData(NSString *bundleRoot, NSString *outputFile);
void importTemplates(NSString *bundleRoot, NSString *outputFile);
void importCommands(NSString *bundleRoot, NSString *outputFile);
void importDragCommands(NSString *bundleRoot, NSString *outputFile);
void importMacros(NSString *bundleRoot, NSString *outputFile);
void processIq(NSString *bundleRoot, NSString *outputDir, NSString *rootScope, NSDictionary *languageDict);

int createOutputDir(NSString *outputFile);