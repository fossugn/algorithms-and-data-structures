//
//  ViewController.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/8/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "ViewController.h"

//Tests
#import "FindPivotIndex.h"
#import "RevertArray.h"
#import "ArrayLeftRotation.h"
#import "CheckIfBST.h"
#import "TriesContacts.h"
#import "BubbleSort.h"
#import "InsertionSort.h"
#import "SelectionSort.h"
#import "QuickSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTests];
    [self startTests];
}

- (void)setupTests {
    
}

- (void)startTests {
//    FindPivotIndex *pivotIndexTest = [FindPivotIndex new];
//    [pivotIndexTest setupTest];
//    [pivotIndexTest startTest];
//    
//    RevertArray *revertArrayTest = [RevertArray new];
//    [revertArrayTest startTest];
//    
//    ArrayLeftRotation *arrayLeftRotationTest = [ArrayLeftRotation new];
//    [arrayLeftRotationTest startTest];
    
//    CheckIfBST *checkIfBST = [CheckIfBST new];
//    [checkIfBST startTest];
    
//    TriesContacts *triesContacts = [TriesContacts new];
//    [triesContacts setupTest];
//    [triesContacts startTest];
    
//    BubbleSort *bubbleSort = [BubbleSort new];
//    [bubbleSort setupTest];
//    [bubbleSort startTest];
    
//    InsertionSort *insertionSort = [InsertionSort new];
//    [insertionSort setupTest];
//    [insertionSort startTest];
    
//    SelectionSort *selectionSort = [SelectionSort new];
//    [selectionSort setupTest];
//    [selectionSort startTest];
    
//    QuickSort *quickSort = [QuickSort new];
//    [quickSort setupTest];
//    [quickSort startTest];
    
    NSArray *array = @[@1, @3, @3, @2, @1];
    NSUInteger result = 0;
    for (NSNumber *number in array) {
        result = result ^[number integerValue];
    }
    
    NSUInteger first = 1;
    NSUInteger second = 1;
    NSUInteger third = 3;
    NSUInteger four = 2;
    NSUInteger five = 3;
    
    NSUInteger temp = first ^ second;
    temp = temp ^ third;
    temp = temp ^ four;
    temp = temp ^ five;
    
    
//    NSLog(@"%ld", result);
//    NSLog(@"%ld", temp);
    
//    int amount = amountOfOnes(11);
//    printf("%d",amount);
    
    
   // [1,3,6,13,4] 9
   // NSArray *arrayForTest = @[@1, @3, @6, @13, @4];
    
    NSRange range1 = NSMakeRange(3, 7);
    NSRange range2 = NSMakeRange(1, 2);
    
    BOOL isIntersects = [self isRange1:range1 intersectRange2:range2];
    NSLog(@"%@", isIntersects ? @"YES" : @"NO");
}

- (BOOL)isRange1:(NSRange)range1 intersectRange2:(NSRange)range2 {
//    NSRange range = NSIntersectionRange(range1, range2);
//    return range.location != NSNotFound;
    
    if (range1.location == NSNotFound || range1.length == 0
        || range2.length == NSNotFound || range2.length == 0) {
        return NO;
    }
    return (!(range1.location < range2.location) && (range1.location - range2.location) < range2.length) ||
    (!(range2.location < range1.location) && (range2.location - range1.location) < range1.length);
}

int amountOfOnes(unsigned int input) {
    int y=0;
    unsigned int x = input;
    while(x){
        y += x &  1 ;
        x  = x >> 1 ;
    }
    return y;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
