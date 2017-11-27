//
//  ArrayLeftRotation.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/25/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "ArrayLeftRotation.h"

@implementation ArrayLeftRotation

- (void)setupTest {
    
}

- (void)startTest {
    int n = 5;
    int k = 4;

    int a[n];
    a[0] = 1;
    a[1] = 2;
    a[2] = 3;
    a[3] = 4;
    a[4] = 5;
    
    int result[n];
    
    for (int j = 0; j < n; j++) {
        result[(n - k + j)%n] = a[j];
    }
    
    for(int a_i = 0; a_i < n; a_i++){
        printf("%d ", result[a_i]);
    }
    
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:n];
//    for (int i = 0; i < n; i++) {
//        [array addObject:[NSString stringWithFormat:@"%d", a[i]]];
//    }
//    NSString *finalString = [array componentsJoinedByString:@" "];
//    printf("%s", [finalString UTF8String]);
    //NSLog(@"%@", finalString);
}

@end
