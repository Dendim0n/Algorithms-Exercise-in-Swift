// Use MergeSort to sort a linked list.

import Foundation

class Node {
    var next:Node?
    var val:Int?
    init(val:Int) {
        self.val = val
    }
}

class Solution {
    func sort(list:Node?) -> Node? {
        if list == nil || list?.next == nil {
            return list;
        }
        
        let mid = findMiddle(list: list)
        let right = sort(list: mid.next)
        mid.next = nil
        let left = sort(list: list)
        
        return merge(leftList: left, rightList: right)
    }
    func findMiddle(list:Node?) -> Node {
        var slowerNode:Node? = list
        var fasterNode:Node? = list?.next
        while fasterNode?.next != nil && fasterNode != nil {
            fasterNode = fasterNode?.next?.next
            slowerNode = slowerNode?.next
        }
        return slowerNode!
    }
    func merge(leftList:Node?,rightList:Node?) -> Node {
        let outputHead = Node.init(val: -1)
        var head:Node? = outputHead
        var left = leftList
        var right = rightList
        while left != nil && right != nil {
            if (left?.val)! < (right?.val)! {
                head?.next = left
                left = left?.next
            } else {
                head?.next = right
                right = right?.next
            }
            head = head?.next
        }
        if left == nil {
            head?.next = right
            right = right?.next
        } else if right == nil {
            head?.next = left
            left = left?.next
        }
        return outputHead.next!
    }
}
let list = Node.init(val: 5)
let nodea = Node.init(val: 4)
let nodeb = Node.init(val: 3)
let nodec = Node.init(val: 2)
let noded = Node.init(val: 1)

list.next = nodea
nodea.next = nodeb
nodeb.next = nodec
nodec.next = noded

let solu = Solution()
solu.sort(list: list)?.val
