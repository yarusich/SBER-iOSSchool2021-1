//
//  ViewController.m
//  L29-objc-p2
//
//  Created by Антон Сафронов on 07.07.2021.
//

#import "ViewController.h"
#import "ArrayDelegate.h"

@interface ViewController () <DelegateProtocol>

@property (nonatomic, strong) ArrayDelegate *delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = [[ArrayDelegate alloc] init];
    self.delegate.delegate = self;
    [self.delegate getArray];
}
    -(void)getArray:(NSArray *)array {
        NSArray *sortedNames = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSUInteger firstName = [[obj1 componentsSeparatedByString:@"a"] count];
            NSUInteger secondName = [[obj2 componentsSeparatedByString:@"a"] count];
            
            if (firstName > secondName) {
                return NSOrderedAscending;
            } else if (firstName < secondName) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        NSLog(@"%@", sortedNames);
    }
    

//        if ([obj1 length] < [obj2 length]) {
//            return NSOrderedAscending;
//        } else if ([obj1 length] > [obj2 length]) {
//            return NSOrderedDescending;
//        } else {
//            return NSOrderedSame;
//        }
//    }];
//    NSLog(@"%@", sortedNames);
//}

@end
