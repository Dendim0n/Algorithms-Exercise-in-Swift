//: Playground - noun: a place where people can play

import Foundation

class Solution {
    func QuickSort(list: inout [Int], first: Int, last: Int) {
        var i, j, key: Int
        if first >= last {
            return;
        }
        i = first
        j = last
        key = list[i]
        while i < j {
            //找出来比key小的 并排到key前面
            while i < j && list[j] > key {
                j -= 1
            }
            if i < j {
                list[i] = list[j]
                i += 1
            }
            //找出来比key大的 并排到key后面
            while i < j && list[i] < key {
                i += 1
            }
            if i < j {
                list[j] = list[i]
                j -= 1
            }
        }
        list[i] = key
        //将key前面元素递归的进行下一轮排序
        if first < i - 1 {
            QuickSort(list: &list, first: first, last: i - 1)
        }
        //将key后面的元素递归的进行下一轮排序
        if i + 1 < last {
            QuickSort(list: &list, first: i + 1, last: last)
        }
    }
}

