//
//  TriesContacts.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/26/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "TriesContacts.h"

#pragma mark - TrieNode Class

@interface TrieNode : NSObject

@property (nonatomic, assign) BOOL isCompleteWord;
@property (nonatomic, assign) NSUInteger amountOfOccurences;
@property (nonatomic, strong) NSString *letter;
@property (nonatomic, strong) NSMutableArray *childNodes;

@end

@implementation TrieNode

+ (TrieNode *)nodeWithLetter:(NSString *)letter {
    TrieNode *node = [TrieNode new];
    node.letter = letter;
    node.amountOfOccurences = 0;
    node.isCompleteWord = NO;
    node.childNodes = [NSMutableArray array];
    return node;
}

@end


#pragma mark - TriesContacts Class implementation

@interface TriesContacts ()

@property (nonatomic, strong) TrieNode *rootNode;

- (void)add:(NSString *)contactString;
- (NSInteger)find:(NSString *)contactString;

@end

@implementation TriesContacts

- (void)setupTest {
    self.rootNode = [TrieNode new];
    self.rootNode.letter = @"";
    self.rootNode.amountOfOccurences = 0;
    self.rootNode.isCompleteWord = YES;
    self.rootNode.childNodes = [NSMutableArray array];
}

- (NSInteger)find:(NSString *)contactString {
    TrieNode *firstNode = self.rootNode;
    
    //Go through root's children to find a branch
    for (TrieNode *node in self.rootNode.childNodes) {
        if ([node.letter isEqualToString:[contactString substringToIndex:1]]) {
            firstNode =  node;
            break;
        }
    }
    
    __block TrieNode *currentNode = firstNode;
    
    //in case firstNode is a child of rootNode then 1st letter of string already matched
    int indexToStart = ([firstNode isEqual:self.rootNode]) ? 0 : 1;
    
    for (int i = indexToStart; i < contactString.length; i++) {
        __block NSInteger currentIndex = -1;
        NSString *currentLetter = [contactString substringWithRange:NSMakeRange(i, 1)];
        
        //Enumerate through child Nodes of current node to match the letter
        [currentNode.childNodes enumerateObjectsUsingBlock:^(TrieNode *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.letter isEqualToString:currentLetter]) {
                currentIndex = idx;
                *stop = YES;
            }
        }];
        
        //If the matching node in current node's children was found
        // - make current Node the matching child node for next iteration
        // - otherwise return 0
        if (currentIndex >= 0) {
            currentNode = [currentNode.childNodes objectAtIndex:currentIndex];
        } else {
            return 0;
        }
    }
    return currentNode.amountOfOccurences;

}

- (void)add:(NSString *)contactString {
    TrieNode *firstNode = self.rootNode;
    
    //Go through root's children to find a branch
    for (TrieNode *node in self.rootNode.childNodes) {
        if ([node.letter isEqualToString:[contactString substringToIndex:1]]) {
            firstNode =  node;
            break;
        }
    }

    //Save occurence of word if it is one-letter word
    if (![firstNode isEqual:self.rootNode]) {
        firstNode.amountOfOccurences++;
    }
    
    
    __block TrieNode *currentNode = firstNode;
    
    //in case firstNode is a child of rootNode then 1st letter of string already matched
    int indexToStart = ([firstNode isEqual:self.rootNode]) ? 0 : 1;
    
    for (int i = indexToStart; i < contactString.length; i++) {
        __block NSInteger currentIndex = -1;
        NSString *currentLetter = [contactString substringWithRange:NSMakeRange(i, 1)];
        
        //Enumerate through child Nodes of current node to match the letter
        [currentNode.childNodes enumerateObjectsUsingBlock:^(TrieNode *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.letter isEqualToString:currentLetter]) {
                currentIndex = idx;
                *stop = YES;
            }
        }];
        
        //If the matching node in current node's children was found
        // - make current Node the matching child node for next iteration
        // - otherwise create a node and add it as a child
        if (currentIndex >= 0) {
            currentNode = [currentNode.childNodes objectAtIndex:currentIndex];
        } else {
            TrieNode *newNode = [TrieNode nodeWithLetter:currentLetter];
            [currentNode.childNodes addObject:newNode];
            currentNode = newNode;
        }
        
        //increase the occurences of current node since it found and passed or just created
        currentNode.amountOfOccurences++;
        
        //set up a flag of is the word is complete on current Node
        if (i == contactString.length - 1) {
            currentNode.isCompleteWord = YES;
        }
    }
    
}

- (void)startTest {

    NSArray *testArrayOfWords = @[@"the", @"a", @"there", @"answer", @"any", @"by", @"bye", @"their"];
    for (NSString *testString in testArrayOfWords) {
        [self add:testString];
    }
    NSLog(@"Amount of occurencies of 'an'       : %ld", [self find:@"an"]);
    NSLog(@"Amount of occurencies of 'byed'     : %ld", [self find:@"byed"]);
    NSLog(@"Amount of occurencies of 'they'     : %ld", [self find:@"they"]);
    NSLog(@"Amount of occurencies of 'th'       : %ld", [self find:@"th"]);
    
}

@end
