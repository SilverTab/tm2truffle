#import <Foundation/Foundation.h>

void importSnippets(NSString *bundleRoot, NSString *outputFile);
void importLanguages(NSString *bundleRoot, NSString *outputFile);
void copyResources(NSString *bundleRoot, NSString *outputFile);
int importMetaData(NSString *bundleRoot, NSString *outputFile);

int createOutputDir(NSString *outputFile);