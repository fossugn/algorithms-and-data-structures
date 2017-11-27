//
//  QuickSort.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 27.11.17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "QuickSort.h"

@interface QuickSort ()

@property (nonatomic, strong) NSArray *unsortedArray;
@property (nonatomic, strong) NSMutableArray *sortedArray;

@end

@implementation QuickSort

- (void)setupTest {
    self.unsortedArray = @[@8, @79, @1, @6, @8, @31, @0, @7, @12, @25];
}

- (void)startTest {
    NSLog(@"UNSorted Array: %@ \n", self.unsortedArray);
    self.sortedArray = [self.unsortedArray mutableCopy];
  
    [self quickSortWithLeftIndex:0 rightIndex:self.unsortedArray.count -1];
    
    NSLog(@"Sorted Array: %@", self.sortedArray);
}

- (NSUInteger)partitionWithLeftIndex:(NSUInteger)leftIndex rightIndex:(NSUInteger)rightIndex pivotIndex:(NSUInteger)pivotIndex {
    NSUInteger leftPointer = leftIndex - 1;
    NSUInteger rightPointer = rightIndex;
    
    while (true) {
        while ([self.sortedArray[leftPointer++] integerValue] < pivotIndex) {
            //do nothing
        }
        while (rightPointer > 0 && [self.sortedArray[rightPointer--] integerValue] > pivotIndex) {
            //do nothing
        }
        if (leftPointer >= rightPointer) {
            break;
        } else {
            [self swapValueIndex1:leftPointer valueIndex2:rightPointer];
        }
    }
    
    [self swapValueIndex1:leftPointer valueIndex2:rightIndex];
    return leftPointer;
}

- (void)swapValueIndex1:(NSUInteger)valueIndex1 valueIndex2:(NSUInteger)valueIndex2 {
    NSNumber *temp = self.sortedArray[valueIndex1];
    self.sortedArray[valueIndex1] = self.sortedArray[valueIndex2];
    self.sortedArray[valueIndex2] = temp;
}

- (void)quickSortWithLeftIndex:(NSUInteger)leftIndex rightIndex:(NSUInteger)rightIndex {
    if (rightIndex - leftIndex <= 0) {
        return;
    } else {
        NSUInteger pivot = [self.sortedArray[rightIndex] integerValue];
        NSUInteger partitionPoint = [self partitionWithLeftIndex:leftIndex rightIndex:rightIndex pivotIndex:pivot];
        [self quickSortWithLeftIndex:leftIndex rightIndex:partitionPoint - 1];
        [self quickSortWithLeftIndex:partitionPoint + 1 rightIndex:rightIndex];
    }
}

@end
