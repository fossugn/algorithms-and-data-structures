//
//  CheckIfBST.m
//  InterviewPreparation
//
//  Created by Eugene Kutia on 11/26/17.
//  Copyright © 2017 EugeneKutia. All rights reserved.
//

#import "CheckIfBST.h"

struct Node {
    int data;
    Node* left;
    Node* right;
};

bool isBST(Node* root, int min, int max) {
    if (root == NULL) {
        return true;
    }
    
    if ((root->data < min) || (root->data > max)) {
        return false;
    }
    
    
    if (root->left) {
        bool isLeftBST = false;
        isLeftBST = isBST(root->left, min, root->data - 1 );
        if (!isLeftBST) {
            return false;
        }
    }
    if (root->right) {
        bool isRightBST = false;
        isRightBST = isBST(root->right, root->data + 1, max);
        if (!isRightBST) {
            return false;
        }
    }
    bool result = true;
    
    printf("root %d \n", root->data);
    printf("%s \n", result ? "true" : "false");
    printf("----------- \n");
    return result;
}

bool checkBST(Node* root) {
    
    return isBST(root, 0, 10001);
    
}

@implementation CheckIfBST

- (void)startTest {
    Node *node1 = new Node;
    node1->data = 1;
    node1->left = NULL;
    node1->right = NULL;
    
    Node *node3 = new Node;
    node3->data = 3;
    node3->left = NULL;
    node3->right = NULL;
    
    Node *node5 = new Node;
    node5->data = 5;
    node5->left = NULL;
    node5->right = NULL;
    
    Node *node7 = new Node;
    node7->data = 7;
    node7->left = NULL;
    node7->right = NULL;
    
    Node *node2 = new Node;
    node2->data = 2;
    node2->left = node1;
    node2->right = node3;
    
    Node *node6 = new Node;
    node6->data = 6;
    node6->left = node5;
    node6->right = node7;
    
    Node *node4 = new Node;
    node4->data = 4;
    node4->left = node2;
    node4->right = node6;
    
    
    bool isBST = checkBST(node4);
    printf("%s", isBST ? "yes" : "no");
}

@end




