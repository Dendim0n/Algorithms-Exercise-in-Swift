//: 3Ways of BFS

import Foundation

class Node {
    var val:String
    var leftNode:Node?
    var rightNode:Node?
    init(val:String) {
        self.val = val;
    }
}

//#1:Two Queue
class Solution1 {
    func bfs(node:Node) {
        var queue1 = [Node]()
        var queue2 = [Node]()
        var level = 0
        
        queue1.append(node)
        
        while queue1.count != 0 {
            print("level:\(level)")
            var levelStr = ""
            for node in queue1 {
                if node.leftNode != nil {
                    queue2.append(node.leftNode!)
                }
                if node.rightNode != nil {
                    queue2.append(node.rightNode!)
                }
                levelStr += node.val
            }
            print(levelStr)
            levelStr = ""
            level += 1
            queue1.removeAll()
            print("level:\(level)")
            for node in queue2 {
                if node.leftNode != nil {
                    queue1.append(node.leftNode!)
                }
                if node.rightNode != nil {
                    queue1.append(node.rightNode!)
                }
                levelStr += node.val
            }
            print(levelStr)
            levelStr = ""
            level += 1
            queue2.removeAll()
        }
    }
}
//#1:One Queue + Dummy Node
class Solution2 {
    func bfs(node:Node) {
        var queue = [Node]()
        var buffer = [Node]()
        var level = 0
        queue.append(node)
        queue.append(Node.init(val: "#"))
        
        while queue.count != 0 {
            
            let node = queue.removeFirst()
            if node.val == "#" {
                print("level:\(level)")
                var bufferstr = ""
                for node in buffer {
                    bufferstr += node.val
                }
                print(bufferstr)
                buffer = [Node]()
                level += 1
                queue.append(Node.init(val: "#"))
                if queue.count == 1 {
                    break
                }
            } else {
                buffer.append(node)
                if node.leftNode != nil {
                    queue.append(node.leftNode!)
                }
                if node.rightNode != nil {
                    queue.append(node.rightNode!)
                }
            }
        }
    }
}
//#3:One Queue
class Solution3 {
    func bfs(node:Node) {
        var queue = [Node]()
        var buffer = [Node]()
        var level = 0
        queue.append(node)
        while !queue.isEmpty {
            let length = queue.count
            for _ in 0..<length {
                let node = queue.removeFirst()
                buffer.append(node)
                if node.leftNode != nil {
                    queue.append(node.leftNode!)
                }
                if node.rightNode != nil {
                    queue.append(node.rightNode!)
                }
            }
            
            print("level:\(level)")
            var bufferstr = ""
            for node in buffer {
                bufferstr += node.val
            }
            print(bufferstr)
            buffer = [Node]()
            level += 1
        }
    }
    
}

let nodeA = Node.init(val: "1");
let nodeB = Node.init(val: "2");
let nodeC = Node.init(val: "3");
let nodeD = Node.init(val: "4");

let nodeE = Node.init(val: "2");
let nodeF = Node.init(val: "3");
let nodeG = Node.init(val: "5");
let nodeH = Node.init(val: "6");

/*
 A1
 B2      E2
 C3 D4   F3  G5
 H6
 */

nodeA.leftNode = nodeB
nodeB.leftNode = nodeC
nodeB.rightNode = nodeD

nodeA.rightNode = nodeE
nodeE.leftNode = nodeF
nodeE.rightNode = nodeG
nodeG.leftNode = nodeH

print("***Solution1***")
let solu1 = Solution1()
solu1.bfs(node: nodeA)

print("***Solution2***")
let solu2 = Solution2()
solu2.bfs(node: nodeA)

print("***Solution3***")
let solu3 = Solution3()
solu3.bfs(node: nodeA)

