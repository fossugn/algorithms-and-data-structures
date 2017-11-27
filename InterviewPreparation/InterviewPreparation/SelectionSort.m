//
//  SelectionSort.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 27.11.17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "SelectionSort.h"


@interface SelectionSort ()

@property (nonatomic, strong) NSArray *unsortedArray;

@end

@implementation SelectionSort

- (void)setupTest {
    self.unsortedArray = @[@8, @79, @1, @6, @8, @31, @0, @7, @12, @25];
}

- (void)startTest {
    NSLog(@"UNSorted Array: %@ \n", self.unsortedArray);
    NSMutableArray *sortedArray = [self.unsortedArray mutableCopy];
    NSInteger position = 0;
    for (int i = 0; i < sortedArray.count - 1; i++) {
        position = i;
       
        for (int j = i + 1; j < sortedArray.count; j++) {
            if (sortedArray[j] < sortedArray[position]) {
                position = j;
            }
        }
        if (position != i) {
            NSNumber *temp = sortedArray[position];
            sortedArray[position] = sortedArray[i];
            sortedArray[i] = temp;
        }

    }
    NSLog(@"Sorted Array: %@", sortedArray);
}

@end
