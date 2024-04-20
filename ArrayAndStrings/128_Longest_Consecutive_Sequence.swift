import UIKit

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    
    var numsSet = Set(nums)
    var longestSeq = 0
    
    for num in nums {
        if !numsSet.contains(num - 1) {
            var lengthOfSeq = 1
            var currNum = num
            while (numsSet.contains(currNum + 1)) {
                currNum += 1
                lengthOfSeq += 1
            }
            longestSeq = max(lengthOfSeq, longestSeq)
        }
    }
    return longestSeq
}

print(longestConsecutive([100,4,200,1,3,2]))
