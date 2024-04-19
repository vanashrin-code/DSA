import UIKit
/*
func productExceptSelf(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    
    var prefixArr = Array(repeating: 1, count: nums.count)
    var suffixArr = Array(repeating: 1, count: nums.count)
    var result = Array(repeating: 0, count: nums.count)
    
    for i in 1..<nums.count {
        prefixArr[i] = prefixArr[i-1] * nums[i-1]
    }
    print(prefixArr)
    print((0..<nums.count - 2).reversed())
    for i in (0..<nums.count - 1).reversed() {
        suffixArr[i] = suffixArr[i+1] * nums[i+1]
    }
    print(suffixArr)
    
    for i in 0..<result.count {
        result[i] = prefixArr[i] * suffixArr[i]
    }
    
    return result
}
*/


func productExceptSelf(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var result = Array(repeating:1, count: nums.count)
        
    for i in 1..<nums.count  {
        result[i] = result[i - 1] * nums[i-1]
    }
    var suffix = 1
    
    for i in (0..<nums.count).reversed() {
        // [1, 2, 3, 4]
        result[i] *= suffix
        suffix *= nums[i]
        
    }
    return result
}
print(productExceptSelf([1,2,3,4]))
