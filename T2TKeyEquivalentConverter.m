//
//  T2TKeyEquivalentConverter.m
//  tm2truffle
//
//  Created by Alex Gordon on 20/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "T2TKeyEquivalentConverter.h"

#define map_equiv(ch, name) else if (c == ch) [equiv addObject:name]; 

NSArray* T2TConvertKeyEquivalent(NSString* textmate)
{
	NSMutableArray* equiv = [[NSMutableArray alloc] init];
	
	unichar* str = malloc(sizeof(unichar) * [textmate length]);
	[textmate getCharacters:str range:NSMakeRange(0, [textmate length])];
	
	//Try to parse one or more modifiers
	NSUInteger i = 0;
	NSInteger length = [textmate length];
	for (i = 0; i < length - 1; i++)
	{
		unichar c = str[i];
		
		if (NO) { }
		map_equiv('@', @"[cmd]")
		map_equiv('$', @"[shift]")
		map_equiv('^', @"[ctrl]")
		map_equiv('~', @"[alt]")
		else
			break;
	}
	
	//Try to parse special keys
	NSMutableString *finalString = [[NSMutableString alloc] initWithCapacity:1];
	for (; i < [textmate length]; i++)
	{
		unichar c = str[i];
		
		if (NO) { }
		map_equiv(0x0003, @"[cancel]")
		map_equiv(0x0009, @"[tab]")
		map_equiv(0x000A, @"[return]")
		map_equiv(0x000D, @"[enter]")
		map_equiv(0x001B, @"[esc]")
		map_equiv(0x0020, @"[space]")
		map_equiv(0x007F, @"[backspace]")
		map_equiv(0xF700, @"[up]")
		map_equiv(0xF701, @"[down]")
		map_equiv(0xF702, @"[left]")
		map_equiv(0xF703, @"[right]")
		map_equiv(0xF704, @"[f1]")
		map_equiv(0xF705, @"[f2]")
		map_equiv(0xF706, @"[f3]")
		map_equiv(0xF707, @"[f4]")
		map_equiv(0xF708, @"[f5]")
		map_equiv(0xF709, @"[f6]")
		map_equiv(0xF70A, @"[f7]")
		map_equiv(0xF70B, @"[f8]")
		map_equiv(0xF70C, @"[f9]")
		map_equiv(0xF70D, @"[f10]")
		map_equiv(0xF70E, @"[f11]")
		map_equiv(0xF70F, @"[f12]")
		map_equiv(0xF710, @"[f13]")
		map_equiv(0xF711, @"[f14]")
		map_equiv(0xF712, @"[f15]")
		map_equiv(0xF713, @"[f16]")
		map_equiv(0xF714, @"[f17]")
		map_equiv(0xF715, @"[f18]")
		map_equiv(0xF716, @"[f19]")
		map_equiv(0xF717, @"[f20]")
		map_equiv(0xF718, @"[f21]")
		map_equiv(0xF719, @"[f22]")
		map_equiv(0xF71A, @"[f23]")
		map_equiv(0xF71B, @"[f24]")
		map_equiv(0xF727, @"[insert]")
		map_equiv(0xF728, @"[del]")
		map_equiv(0xF729, @"[home]")
		map_equiv(0xF72B, @"[end]")
		map_equiv(0xF72C, @"[pageup]")
		map_equiv(0xF72D, @"[pagedown]")
		map_equiv(0xF72E, @"[snapshot]")
		map_equiv(0xF72F, @"[scroll]")
		map_equiv(0xF730, @"[pause]")
		map_equiv(0xF746, @"[help]")
		map_equiv(0xF735, @"[menu]")
		map_equiv(0xF739, @"[clear]")
		map_equiv(0xF732, @"[cancel]")
		else
		{
			if (c >= 'A' && c <= 'Z')
			{				
				c -= 'A' - 'a';
				[equiv addObject:@"[shift]"];
			}
			
			[finalString appendFormat:@"%C", c];
		}
	}
	
	if ([finalString length])
		[equiv addObject:finalString];
	
	free(str);
	
	[equiv removeDuplicates];
	
	return equiv;
}