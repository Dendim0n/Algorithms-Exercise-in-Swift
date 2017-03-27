//: Playground - noun: a place where people can play

import Foundation
import UIKit

class Solution {
    func search(input:NSString, target:NSString) -> Int { //O(n*m)
        guard input.length >= target.length else {
            return -1
        }
        for i in 0..<(input.length - target.length) {
            for j in 0..<target.length {
                if input.substring(with: NSRange.init(location: i + j, length: 1)) != target.substring(with: NSRange.init(location: j, length: 1)) {
                    break
                }
                if j == target.length - 1 {
                    return i
                }
            }
        }
        return -1
    }
}

let solution = Solution()
solution.search(input: "123", target: "321")