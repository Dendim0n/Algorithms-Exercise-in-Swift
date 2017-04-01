//: Playground - noun: a place where people can play

import Foundation

class BinaryNode {
    var val:String?
    var left:BinaryNode?
    var right:BinaryNode?
}

class Solution {
    func preorderTraverse_recursive(node:BinaryNode?){
        if node == nil {
            return
        }
        print(node!.val)
        preorderTraverse_recursive(node: node!.left)
        preorderTraverse_recursive(node: node!.right)
    }
}

