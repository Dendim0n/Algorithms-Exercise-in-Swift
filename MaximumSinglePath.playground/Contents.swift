//: Playground - noun: a place where people can play

import Foundation

class Node {
    var val:Int
    var leftNode:Node?
    var rightNode:Node?
    init(val:Int) {
        self.val = val;
    }
}

class Solution {
    class func MaximumSinglePathSum(node:Node?) -> (Int,Int) { //singlePath,maxPath
        if node == nil {
            return (0,Int.min)
        }
        let left = MaximumSinglePathSum(node: node!.leftNode)
        let right = MaximumSinglePathSum(node: node!.rightNode)
        
        var singlePath = max(left.0, right.0) + node!.val
        singlePath = max(singlePath, 0)
        
        var maxPath = max(left.1, right.1)
        maxPath = max(maxPath, left.0 + right.0 + node!.val)
        
        return (singlePath,maxPath)
    }
}

let nodeA = Node.init(val: 1);
let nodeB = Node.init(val: 2);
let nodeC = Node.init(val: 3);
let nodeD = Node.init(val: 4);

let nodeE = Node.init(val: 2);
let nodeF = Node.init(val: 3);
let nodeG = Node.init(val: 5);

/*
       A1
   B2      E2
 C3 D4   F3 G5
 
 */

nodeA.leftNode = nodeB
nodeB.leftNode = nodeC
nodeB.rightNode = nodeD

nodeA.rightNode = nodeE
nodeE.leftNode = nodeF
nodeE.rightNode = nodeG


Solution.MaximumSinglePathSum(node: nodeA)
