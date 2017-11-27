//
//  InsertionSort.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 27.11.17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "InsertionSort.h"

@interface InsertionSort ()

@property (nonatomic, strong) NSArray *unsortedArray;

@end

@implementation InsertionSort

- (void)setupTest {
    self.unsortedArray = @[@8, @79, @1, @6, @8, @31, @0, @7, @12, @25];
}

- (void)startTest {
    NSLog(@"UNSorted Array: %@ \n", self.unsortedArray);
    NSMutableArray *sortedArray = [self.unsortedArray mutableCopy];
    NSNumber *valueToInsert = nil;
    NSInteger position = 1;
    for (int i = 1; i < sortedArray.count; i++) {
        valueToInsert = sortedArray[i];
        position = i;
        while (position > 0 && sortedArray[position-1] > valueToInsert ) {
            sortedArray[position] = sortedArray[position - 1];
            position--;
        }
        if (position != i) {
            sortedArray[position] = valueToInsert;
        }
    }
    NSLog(@"Sorted Array: %@", sortedArray);
}

@end
