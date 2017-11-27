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
    
    TriesContacts *triesContacts = [TriesContacts new];
    [triesContacts setupTest];
    [triesContacts startTest];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
