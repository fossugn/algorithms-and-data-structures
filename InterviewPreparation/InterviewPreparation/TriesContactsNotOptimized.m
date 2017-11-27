//
//  TriesContactsNotOptimized.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/27/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject

@property (nonatomic, assign) BOOL isCompleteWord;
@property (nonatomic, assign) int amountOfOccurences;
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

@interface TriesContacts : NSObject

@property (nonatomic, strong) TrieNode *rootNode;

- (void)add:(NSString *)contactString;
- (int)find:(NSString *)contactString;

@end

@implementation TriesContacts

- (void)setupTest {
    self.rootNode = [TrieNode new];
    self.rootNode.letter = @"";
    self.rootNode.amountOfOccurences = 0;
    self.rootNode.isCompleteWord = YES;
    self.rootNode.childNodes = [NSMutableArray array];
}

- (int)find:(NSString *)contactString {
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

@end


int main(int argc, const char * argv[]){
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int n;
    scanf("%i",&n);
    
    TriesContacts *triesContacts = [TriesContacts new];
    [triesContacts setupTest];
    
    for(int a0 = 0; a0 < n; a0++){
        NSString* op;
        char* op_temp = (char *)malloc(512000 * sizeof(char));
        NSString* contact;
        char* contact_temp = (char *)malloc(512000 * sizeof(char));
        scanf("%s %s",op_temp,contact_temp);
        op = [NSString stringWithFormat:@"%s", op_temp];
        contact = [NSString stringWithFormat:@"%s", contact_temp];
        if ([op isEqualToString:@"add"]) {
            [triesContacts add:contact];
        } else if ([op isEqualToString:@"find"]) {
            printf("%d\n", [triesContacts find:contact]);
        }
    }
//    [pool drain];
    return 0;
}
