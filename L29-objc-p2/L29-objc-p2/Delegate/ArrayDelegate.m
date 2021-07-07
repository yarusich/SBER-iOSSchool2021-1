//
//  ArrayDelegate.m
//  L29-objc-p2
//
//  Created by Антон Сафронов on 07.07.2021.
//

#import "ArrayDelegate.h"

@implementation ArrayDelegate

-(void)getArray {
    NSArray *array = @[@"Adriana", @"Abigail", @"Alice", @"Aria", @"Aaron", @"Alan", @"Abraham", @"Andrew", @"Alexander"];
    [self.delegate getArray:array];
}

@end


