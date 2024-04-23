import UIKit

func trap(_ height: [Int]) -> Int {
    guard height.count > 0 else { return 0 }
    
    var result = 0
    var left = 0, right = height.count - 1
    
    // initially set the max right and max left
    var maxLeft = height[left], maxRight = height[right]
    
    while left < right {
        if maxLeft < maxRight {
            left += 1
            maxLeft = max(maxLeft, height[left])
            result += maxLeft - height[left]
        } else {
            right -= 1
            maxRight = max(maxRight, height[right])
            result += maxRight - height[right]
        }
    }
    return result
}

print(trap([4,2,0,3,2,5]))
//Output: 9
