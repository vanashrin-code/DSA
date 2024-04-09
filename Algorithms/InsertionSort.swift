import UIKit
// Insertion sort is based on picking and compairing the element and performing insertion
// The array is considered as 2 groups, sorted and unsorted without dividing the actual array

// For eg: [9 | 3 | 2 | 6 | 4 | 8 | 5 | 0 | 1]
// In this array, we will assume there are 2 groups where one is sorted and other is unsorted
// [9 -> sorted | 3 | 2 | 6 | 4 | 8 | 5 | 0 | 1] -> unsorted

// We will keep picking 1 element from the unsorted group and compairing it with the sorted group
// [9  |  | 2 | 6 | 4 | 8 | 5 | 0 | 1]
//       |
//       3
// Here we will pick 3 with the elements on left. Since 9 is greater than 3, we will shift 9 to right
// [3 | 9  ->sorted  | 2 | 6 | 4 | 8 | 5 | 0 | 1] -> unsorted

// next we will pick 2 and compare it with the left side of the array

// [3 | 9 |   | 6 | 4 | 8 | 5 | 0 | 1]
//          |
//          2

// Since 9 is greater than 2, we will shift 9 to the right
// [3 |  | 9 | 6 | 4 | 8 | 5 | 0 | 1]
//         |
//         2
// Now we will compare 2 with 3. Since 3 is greater that 2, we will shift 3 to the right
// [  | 3  | 9 | 6 | 4 | 8 | 5 | 0 | 1]
//          |
//          2
// As there are no numbers left to check, we will place 2 in the empty space at 1st position here
// [ 2 | 3  | 9 | 6 | 4 | 8 | 5 | 0 | 1]
// This itteration will continue to work until we have looped through all the elements

// Big- O notation for insertion sort is O(n2)
// Best case scenario could be O(n)

func insertionSort(arr:[Int]) -> [Int] {
    var resultArray = arr
        
    // assuming 2 groups, consider left element sorted and loop through item at index 1 till the end
    for i in 1..<resultArray.count {
        // store value in a temp variable so that even after shifting values, we have original value with us
        let temp = resultArray[i]
        var leftElementIndex = i - 1 // take left elements index
        
        while(leftElementIndex >= 0 && resultArray[leftElementIndex] > temp)
        {
            resultArray[leftElementIndex+1] = resultArray[leftElementIndex]
            leftElementIndex -= 1
        }
        resultArray[leftElementIndex + 1] = temp
    }
    return resultArray
}

print(insertionSort(arr: [9, 3, 2, 6, 4, 8, 5, 0, 1]))
