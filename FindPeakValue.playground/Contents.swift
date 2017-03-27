//: Find a peak value in an array

import Foundation

class Solution {
    func peakValue(arr:Array<Int>) -> (Int,Int) {
        var start = 0
        var end = arr.count - 1
        var mid = (start + end) / 2
        while start + 1 < end {
            if (arr[mid] > arr[mid + 1]) && (arr[mid] > arr[mid - 1]) {
                return (mid,arr[mid])
            }
            if arr[mid] < arr[mid + 1] {
                start = mid
                mid = (start + end) / 2
            } else if arr[mid] < arr[mid - 1] {
                end = mid
                mid = (start + end) / 2
            }
        }
        return (-1,-1)
    }
}

let solution = Solution()
solution.peakValue(arr: [1,2,3,4,5,3,2,1,2,4,3,7,2,1])