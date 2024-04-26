import UIKit

func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    //[3,4,5,1,2]
    var l = 0, r = nums.count - 1
    
    while l < r {
        let mid = (l + r) / 2
        
        if nums[mid] > nums[r] {
            l = mid + 1
        } else {
            r = mid
        }
        
    }
    return nums[l]
}

print(findMin([2,1]))
