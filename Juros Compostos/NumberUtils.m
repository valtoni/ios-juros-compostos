//
//  NumberUtils.m
//  Juros Compostos
//
//  Created by Valtoni on 3/25/13.
//  Copyright (c) 2013 isis. All rights reserved.
//

#import "NumberUtils.h"

@implementation NumberUtils

void analyzeThis(id anyObject)
{
    NSLog(@"Object %p: %zu, %@", anyObject, sizeof(anyObject), anyObject);
}

NSNumber* toNumber(NSString* string)
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:string];
    return myNumber;
}



@end
