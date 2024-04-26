import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var left = 0, right = nums.count - 1

    while left <= right {
        let mid = left + (right - left) / 2

        if nums[mid] == target { return mid }

        // left sorted portion
        if nums[mid] >= nums[left] {
            if target > nums[mid] || target < nums[left] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            // right sorted portion
            if target < nums[mid] || target > nums[right] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
    return -1
}

print(search([4,5,6,7,0,1,2], 3))
