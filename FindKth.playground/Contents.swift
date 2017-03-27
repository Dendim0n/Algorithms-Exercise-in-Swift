//: Playground - noun: a place where people can play

import Foundation

class Solution {
    func Kth(arr_a:[Int],arr_a_start:Int,arr_b:[Int],arr_b_start:Int,k:Int) -> Int {
        if arr_a_start >= arr_a.count {
            return arr_b[arr_b_start + k - 1]
        } else if arr_b_start >= arr_b.count {
            return arr_a[arr_a_start + k - 1]
        }
        if k == 1 {
            return min(arr_a[arr_a_start], arr_b[arr_b_start])
        }
        let key_a = arr_a_start + k / 2 < arr_a.count ? arr_a[arr_a_start + k/2] : Int.max
        let key_b = arr_b_start + k / 2 < arr_b.count ? arr_b[arr_b_start + k/2] : Int.max
        if key_a < key_b {
            return Kth(arr_a: arr_a, arr_a_start: arr_a_start + k/2, arr_b: arr_b, arr_b_start: arr_b_start, k: k - k/2)
        } else if key_a > key_b {
            return Kth(arr_a: arr_a, arr_a_start: arr_a_start, arr_b: arr_b, arr_b_start: arr_b_start + k/2, k: k - k/2)
        }
        return -1
    }
}
let solution = Solution()
let a = [1,3,7,9]
let b = [2,4,6,8,10]
solution.Kth(arr_a: a, arr_a_start: 0, arr_b: b, arr_b_start: 0, k: 5)
