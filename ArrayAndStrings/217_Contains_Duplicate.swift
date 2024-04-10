import UIKit

class Solution {
    /*
     Intuition
     First approach comes to mind is brute force method to use nested loop, to compare each element with rest of the others. But it the time complexity goes high to O(n^2) with this method
     
     Approach
     There are three basic approach to solving this problem
     
     Brute force: With nested for loop which results in time complexity of O(n^2) but space complexity is minimul since we don't need any extra space O(1)
     
     Sorting: With sorting approach, we need to only check if the adjacent values are same and return true if found which means we have to loop through only once. So the time complexity becomes O(n), but since sorting is involved which already has the time complexity of O(nlogn), the total time complexity becomes O(nlogn) and the space complexity is O(1)
     
     Hashmap/ Dictionary: This is the best approach to follow in this case. Since we only loop through the elements only once and store them in the dictionary, the time complexity here is O(n), but we have to compromise with space complexity here making it O(n) to create an extra dictionary.
     
     Complexity
     Time complexity:
     O(n)
     
     Space complexity:
     O(n)
     */
    
    // Code
    func containsDuplicateDictSolution(_ nums: [Int]) -> Bool {
        // early exit if the nums. count is less than or equals to 1
        guard nums.count >= 1 else { return false }
        
        var dict: [Int: Bool] = [:]
        
        for num in nums {
            if dict[num] == nil {
                dict[num] = true
            } else {
                return true
            }
        }
        return false
    }
    
    /*
     Using Set: Another approach is using converting array to Set. It will eliminate duplicate values and we can check if the count of items in set is less than count of items in array. In that case, there is duplicate in the array. Return true.
     Complexity
     Time complexity:
     O(n) - The Set has time complexity O(n)
     
     Space complexity:
     O(n)
     */
    
    //Code
    func containsDuplicateWithInbuiltSetSolution(_ nums: [Int]) -> Bool {
        guard nums.count >= 1 else { return false }
        
        let numsSet: Set<Int> = Set(nums)
        
        if numsSet.count < nums.count {
            return true
        }
        return false
    }
    
    /*
     Using Set: Last approach is creating a Set and adding the items to the set if it is not already present. This will give early exit from the function.
     Complexity
     Time complexity:
     O(n) - Here the worst case complexity would be O(n)
     
     Space complexity:
     O(n)
     */
    
    //Code
    func containsDuplicateWithSetSolution(_ nums: [Int]) -> Bool {
        guard nums.count >= 1 else { return false }
        
        var numsSet = Set<Int>()
        
        for num in nums {
            if numsSet.contains(num) {
                return true
            }
            numsSet.insert(num)
        }
        return false
    }
}

let duplicateClass = Solution()
duplicateClass.containsDuplicateDictSolution([1,2,3,1])
duplicateClass.containsDuplicateWithSetSolution([1,2,3,1])
duplicateClass.containsDuplicateWithInbuiltSetSolution([1,2,3,1])

