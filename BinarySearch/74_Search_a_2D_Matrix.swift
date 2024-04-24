import UIKit

// Time complexity O(log m*n )
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0 else { return false }
    
    var rows = matrix.count, cols = matrix[0].count
    var left = 0, right = (rows * cols) - 1
    
    while left <= right {
        let midPt = (left + right) / 2
        print(midPt)

        // to convert 2D array into 1D array, we did rows* columns above,
        // so to convert it back we have to divide it by columns
        let mid_ele: Int = matrix[midPt/cols][midPt%cols]
        print(mid_ele)
        if mid_ele == target { return true }
        
        if target < mid_ele {
            right = midPt - 1
        } else if target > mid_ele {
            left = midPt + 1
        }
    }
    
    return false
}

print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
