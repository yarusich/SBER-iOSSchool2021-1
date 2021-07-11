//
//  FirstObjcLib.h
//  FirstObjcLib
//
//  Created by Антон Сафронов on 11.07.2021.
//

#import <Foundation/Foundation.h>
#import "SecondObjcLib.h"

@interface FirstObjcLib : NSObject

@property (strong, nonatomic) NSString *firstString;
@property (strong, nonatomic) SecondObjcLib *secondString;

@end
