/* input: 1->2->3->4->5->6
    start = 1, end = 4
 result: 1->5->4->3->2->6
 */
import Foundation

class Node {
    var next:Node?
    var val:Int
    init(val:Int) {
        self.val = val
    }
}

class Solution {
    func reverse(linkedList:Node) -> Node {
        var prev:Node? = nil
        var head:Node? = linkedList
        
        while head != nil {
            let temp = head?.next
            head?.next = prev
            prev = head
            head = temp
        }
        
        return prev!;
        
    }
    func find(list:Node,pos:Int) -> Node? {
        var node = list
        for _ in 0..<pos {
            if node.next != nil {
                node = node.next!
            } else {
                return nil
            }
        }
        return node
    }
    func printList(list:Node) {
        var input:Node? = list
        while input != nil {
//            print(input?.val)
            input = input?.next
        }
    }
}

let node0 = Node(val: 0)
let node1 = Node(val: 1)
let node2 = Node(val: 2)
let node3 = Node(val: 3)
let node4 = Node(val: 4)
let node5 = Node(val: 5)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

let solu = Solution()
solu.find(list: node0, pos: 0)?.val
//solu.reverse(linkedList: node0, startPos: 2, endPos: 3)
solu.reverse(linkedList: node0).next?.val

