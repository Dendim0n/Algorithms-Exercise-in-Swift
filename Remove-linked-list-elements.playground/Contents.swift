//: Linklist - delete

import Foundation

class ListNode {
    var val:Int
    init(val:Int) {
        self.val = val
    }
    var next:ListNode?
}

class Solution {
    func deleteNode(list:ListNode,val:Int) -> ListNode? {
        let head = list
        var tmpList:ListNode? = head
        repeat {
            if tmpList?.val == val && tmpList?.next != nil {
                tmpList?.val = (tmpList?.next?.val)!
                tmpList?.next = tmpList?.next?.next
                print("del")
            } else if tmpList?.next?.val == val && tmpList?.next?.next == nil {
                tmpList?.next = nil
            } else {
                print("next")
                tmpList = tmpList?.next
            }
        } while tmpList != nil
        return head
    }
    func printNode(list:ListNode?) {
        var tmpList:ListNode? = list
        repeat {
            print(tmpList?.val)
            tmpList = tmpList?.next
        } while tmpList != nil
    }
}

var a:ListNode? = ListNode(val:1)
let b = ListNode(val:2)
let c = ListNode(val:3)
a?.next = b
b.next = c

let solution = Solution()

print("origin:")
solution.printNode(list: a)
print("after:")
solution.deleteNode(list: a!, val: 3)
solution.printNode(list: a)
