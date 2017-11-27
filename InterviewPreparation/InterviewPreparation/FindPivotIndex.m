//
//  FindPivotIndex.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/16/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "FindPivotIndex.h"

@interface FindPivotIndex ()

@property (nonatomic, strong) NSArray *initialArray;

@end

@implementation FindPivotIndex

- (void)setupTest {
//    self.initialArray = @[@1, @7, @3, @6, @5, @6];
//    self.initialArray = @[@1, @2, @3];
}

- (void)startTest {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    int n = 5;
    [array addObject:[NSString stringWithFormat:@"%d", n]];
    NSString *finalString = [array componentsJoinedByString:@" "];
    
    //NSLog(@"<%@:%@:>", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    NSLog(@"%s", __PRETTY_FUNCTION__);
   // NSArray *originalArray = [NSArray arrayWithObjects: @8, @7, @5, @3, @0, @1, @6, @3];
    NSInteger sum = 0;
    NSInteger leftSum = 0;
    for (NSNumber *number in self.initialArray) {
        sum += number.integerValue;
    }
    for (int i = 0; i < self.initialArray.count; i++) {
        NSNumber *curNumber = self.initialArray[i];
        if (leftSum == sum - leftSum - curNumber.integerValue) {
            NSLog(@"Pivot index : %d", i);
            break;
            return;
        }
        leftSum += curNumber.integerValue;
    }
    NSLog(@"Pivot index : NOT FOUND");
}

@end
