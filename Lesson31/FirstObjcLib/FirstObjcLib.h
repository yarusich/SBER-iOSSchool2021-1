//
//  FirstObjcLib.h
//  Lesson31
//
//  Created by Антон Сафронов on 11.07.2021.
//

#import <Foundation/Foundation.h>
#import "SecondObjcLib.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstObjcLib : NSObject

@property (strong, nonatomic, readonly) NSString *firstString;
@property (strong, nonatomic, readonly) SecondObjcLib *secondString;

@end

NS_ASSUME_NONNULL_END
