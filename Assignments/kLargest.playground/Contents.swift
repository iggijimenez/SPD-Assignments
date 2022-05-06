import UIKit

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    //returns the biggest
    for numbers in 1...k {
        return nums.sorted(by: {$0 > $1})[numbers-1]
    }
    return 0
}

var test = findKthLargest([1,2,3,12,49,100,101], 4)
