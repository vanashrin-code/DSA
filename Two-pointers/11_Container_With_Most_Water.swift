import UIKit

func maxArea(_ height: [Int]) -> Int {
    guard height.count > 0 else {return 0}
    
    var result = 0
    var leftPtr = 0
    var rightPtr = height.count - 1
    
    while leftPtr < rightPtr {
        // area of rectangle = length * height
        let area = (rightPtr - leftPtr) * min(height[leftPtr], height[rightPtr])
        result = max(result, area)
        
        height[leftPtr] < height[rightPtr] ? (leftPtr += 1) : (rightPtr -= 1)
    }
    
    return result
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
// output : 49
