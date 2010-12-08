//
//  NSMutableArray+Duplicates.m
//  tm2truffle
//
//  Created by Alex Gordon on 08/12/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+Duplicates.h"


@implementation NSMutableArray (Duplicates)

- (void)removeDuplicates
{
	NSMutableSet *workingSet = [NSMutableSet setWithCapacity:[self count]];
	NSMutableArray *workingArray = [self mutableCopy];
	
	for (id x in self)
	{
		if (![workingSet containsObject:x])
		{
			[workingArray addObject:x];
			[workingSet addObject:x];
		}
	}
	
	[self setArray:workingArray];
}

@end
