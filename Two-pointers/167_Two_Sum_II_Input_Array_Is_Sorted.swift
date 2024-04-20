import UIKit

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        // time complexity O(n^2)
        /*
        guard numbers.count > 0 else { return [] }

        for i in 0..<numbers.count {
            var endPtr = numbers.count - 1
            var diff = target - numbers[i]

            while (endPtr > i) {
                if numbers[endPtr] == diff {
                    return [i+1, endPtr+1]
                }
                endPtr -= 1
            }
        }
        return []
        */

        // time complexity O(n)
        guard numbers.count > 0 else { return [] }

        var startPtr = 0
        var endPtr = numbers.count - 1

        while startPtr < endPtr {
            let totalOfPtrIndex = numbers[startPtr] + numbers[endPtr]

            if totalOfPtrIndex == target {
                return [startPtr + 1, endPtr + 1]
            }
            // if total of two ptrs values is greater than the target, that means we need a smaller number
            // and since the array is sorted, we will move over endPtr by 1
            // else we will move start index by 1
            if totalOfPtrIndex > target {
                endPtr -= 1
            } else {
                startPtr += 1
            }
        }

        return []
    }

print(twoSum([2,7,11,15], 9))
