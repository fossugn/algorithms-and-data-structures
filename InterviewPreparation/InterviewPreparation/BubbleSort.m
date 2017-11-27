//
//  BubbleSort.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 27.11.17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "BubbleSort.h"

@interface BubbleSort ()

@property (nonatomic, strong) NSArray *unsortedArray;

@end

@implementation BubbleSort

- (void)setupTest {
    self.unsortedArray = @[@8, @79, @1, @6, @8, @31, @0, @7, @12, @25];
}

- (void)startTest {
    NSLog(@"UNSorted Array: %@ \n", self.unsortedArray);
    NSMutableArray *sortedArray = [self.unsortedArray mutableCopy];
    for (int i = 0; i < self.unsortedArray.count - 1; i++) {
        for (int j = 0; j < self.unsortedArray.count - i - 1; j ++) {
            NSNumber *valueFirst = sortedArray[j];
            NSNumber *valueSecond = sortedArray[j + 1];
            if (valueFirst.integerValue > valueSecond.integerValue) {
                sortedArray[j + 1] = valueFirst;
                sortedArray[j] = valueSecond;
            }
        }
    }
    NSLog(@"Sorted Array: %@", sortedArray);
    
}

@end
