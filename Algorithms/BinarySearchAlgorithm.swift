import UIKit
// Binary search works on only sorted order
// It uses divide and conquer rule

// eg: [1, 4, 6, 8, 34, 65, 89, 102], k = 34
// Output : 4

func binarySearch(_ array: [Int],_ k: Int) -> Int? {
    guard !array.isEmpty else { return nil }
    
    // set 2 pointers to start and end of the array
    var startPtr: Int = 0
    var endPtr: Int = array.count - 1
    
    // keep compairing the middle values unless two pointers collides
    while startPtr <= endPtr {
        let middleIndex = (startPtr + endPtr) / 2
        let middleValue = array[middleIndex]
        
        if middleValue > k {
            // if middleValue is greater that the expected value,
            // we know that our value is present somewhere to the left side of the array
            // shift the endPtr to the new middleIndex
            endPtr = middleIndex - 1
        } else if middleValue < k {
            // if middleValue is lesser that the expected value,
            // we know that our value is present somewhere to the right side of the array
            // shift the startPtr to the new middleIndex
            startPtr = middleIndex + 1
        } else {
            // return the value found
            return middleIndex
        }
    }
    
    return nil
}

binarySearch([1, 4, 6, 8, 34, 65, 89, 102], 34)
