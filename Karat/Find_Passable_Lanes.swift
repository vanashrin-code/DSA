import UIKit

// O(m*n)
func findPassableLanes(matrix: [[String]]) -> [[Int]] {
    guard matrix.count > 0 else { return [] }

    var rows = [Int]()
    var columns = [Int]()
    
    var result = [[Int]]()
    
    // for rows
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == "+" {
                break
            } else if col == matrix[0].count - 1 {
                rows.append(row)
            }
        }
    }
    
    // for columns
    for col in 0..<matrix[0].count {
        for row in 0..<matrix.count {
            if matrix[row][col] == "+" {
                break
            } else if row == matrix.count - 1 {
                columns.append(col)
            }
        }
    }
    result.append(rows)
    result.append(columns)
    
    return result
}

                       //0   1    2    3    4     5    6
let straightBoard1 = [["+", "+", "+", "0", "+", "0", "0"],
                      ["0", "0", "0", "0", "0", "0", "0"],
                      ["0", "0", "+", "0", "0", "0", "0"],
                      ["0", "0", "0", "0", "+", "0", "0"],
                      ["+", "+", "+", "0", "0", "0", "+"]]
print(findPassableLanes(matrix: straightBoard1))

let board2 = [["+", "+", "+", "+", "+", "+", "+"],
              ["0", "0", "0", "0", "+", "0", "+"],
              ["+", "0", "+", "0", "+", "0", "0"],
              ["+", "0", "0", "0", "+", "+", "+"],
              ["+", "+", "+", "+", "+", "+", "+"]]
print(findPassableLanes(matrix: board2))

let board3 = [["+", "0", "+", "0", "+",],
              ["0", "0", "+", "0", "0",],
              ["+", "0", "+", "0", "+",],
              ["0", "0", "+", "0", "0",],
              ["+", "0", "+", "0", "+"]]
print(findPassableLanes(matrix: board3))

let board4 = [["+", "0", "+", "0", "+",],
              ["0", "0", "0", "0", "0",],
              ["+", "+", "+", "+", "+",],
              ["0", "0", "0", "0", "0",],
              ["+", "0", "+", "0", "+"]]
print(findPassableLanes(matrix: board4))

let board5 = [["+", "0", "0", "0", "+",],
              ["+", "0", "+", "0", "0",],
              ["+", "0", "0", "0", "0",],
              ["+", "0", "0", "0", "+"]]
print(findPassableLanes(matrix: board5))

let board6 = [["+", "+", "+", "+", "+", "+", "+", "+",],
              ["0", "0", "0", "0", "0", "0", "0", "0",],
              ["+", "0", "0", "0", "0", "0", "0", "0",],
              ["+", "0", "0", "0", "0", "0", "0", "+",],
              ["0", "0", "0", "0", "0", "0", "0", "+",],
              ["+", "+", "+", "+", "+", "+", "0", "+"]]
print(findPassableLanes(matrix: board6))
