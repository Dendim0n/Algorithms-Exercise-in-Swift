//: Find minimum value in a Sorted&Rotated Array

import Foundation

class Solution {
    //If there's no same numbers.
    func minimum(arr:Array<Int>) -> Int {
        var start = 0
        var end = arr.count - 1
        var mid = (start + end) / 2
        
        while start + 1 < end {
            if (arr[mid - 1] > arr[mid]) && (arr[mid + 1] > arr[mid]) {
                return arr[mid]
            }
            if arr[mid] > arr[start] {
                start = mid
                mid = (start + end) / 2
            } else if arr[mid] < arr[start] {
                end = mid
                mid = (start + end) / 2
            }
        }
        return arr.first! > arr.last! ? arr.last! : arr.first!
    }
    
    //If there are same numbers.O(n)
    func anotherMinimum(arr:Array<Int>) -> Int {
        var num = arr.first!
        for i in arr {
            if num > i {
                num = i
            }
        }
        return num
    }
}

let arr = [5,6,7,8,9,10,11,12,13,2]
let solution = Solution()
solution.minimum(arr: arr)

let arr2 = [2,2,2,3,4,5,6,7,0,1]
solution.anotherMinimum(arr: arr2)