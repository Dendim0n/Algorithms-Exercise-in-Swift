//: Playground - noun: a place where people can play

import Foundation

class Solution {
    func binarySearch(array:Array<Int>,num:Int) -> Int {
        
        let arr = array.sorted()
        var start = 0
        var end = arr.count - 1
        var mid = (start + end) / 2
        
        while start + 1 < end {
            if arr[mid] > num {
                end = mid
                mid = (start + end) / 2
            } else if arr[mid] < num {
                start = mid
                mid = (start + end) / 2
            } else if arr[mid] == num {
                return mid
            }
        }
        if arr[start] == num {
            return start
        } else if arr[end] == num {
            return end
        } else {
            return -1
        }
    }
    
    func binarySearchRecursive(array:Array<Int>,num:Int,start:Int = 0,end:Int = -1) -> Int {
        
        let mid = (start + end) / 2
        
        if start + 1 < end {
            if array[mid] > num {
                return binarySearchRecursive(array: array, num: num, start: start, end: mid)
            } else if array[mid] < num {
                return binarySearchRecursive(array: array, num: num, start: mid, end: end)
            } else if array[mid] == num {
                return mid
            }
        }
        if array[start] == num {
            return start
        } else if array[end] == num {
            return end
        } else {
            return -1
        }
    }
}

let nums = [1,4,2,5,7,6,2,3,1,4,7,87,4,3,3,1,4,45,23,0]
let numss = [0,1]
let solu = Solution()
solu.binarySearch(array: numss, num: 1)
solu.binarySearchRecursive(array: nums.sorted(), num: 87,end: nums.count - 1)
