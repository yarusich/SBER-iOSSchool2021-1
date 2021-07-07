//
//  ArrayDelegate.h
//  L29-objc-p2
//
//  Created by Антон Сафронов on 07.07.2021.
//

#import <Foundation/Foundation.h>
#import "DelegateProtocol.h"


@interface ArrayDelegate : NSObject

@property(nonatomic, weak) id<DelegateProtocol> delegate;
-(void)getArray;

@end


