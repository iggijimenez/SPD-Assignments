import UIKit

//Given a sorted array of strings, write a recursive function to find the index of the first and last occurrence of a target string. If the target string is not found in the array, report that.

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let lo = searchRange(nums, target, .lo)
    let hi = searchRange(nums, target, .hi)
    return [lo, hi]
}

func searchRange(_ nums: [Int], _ target: Int, _ direction: Direction = .lo) -> Int {
    var start = 0
    var end = nums.count - 1
    var result = -1
    
    while start <= end {
        let mid = (start+end) / 2
        
        if nums[mid] == target {
            result = mid
            if direction == .lo {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if nums[mid] < target {
            start = mid + 1
        } else if nums[mid] > target {
            end = mid - 1
        }
    }
    
    return result
}

//Given a string of digits 2 to 9 a user has pressed on a T9 “old school” telephone keypad, return a list of all letter combinations they could have been trying to type on the keypad.

func dailPad(_ nums: [Int], _ target: Int, _ direction: Direction = .lo) -> Int {
    var start = 0
    var end = nums.count - 1
    var result = -1
    
    while start <= end {
        let mid = (start+end) / 2
        
        if nums[mid] == target {
            result = mid
            if direction == .lo {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if nums[mid] < target {
            start = mid + 1
        } else if nums[mid] > target {
            end = mid - 1
        }
    }
    
    return result
}
