import UIKit

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var sudokuSet = Set<String>()
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            let currCharacter = String(board[i][j])
            if currCharacter != "." {
                
                let row = ("\(currCharacter) in row \(i)")
                if sudokuSet.contains(row) {
                    return false
                } else {
                    sudokuSet.insert(row)
                }
                
                let column = ("\(currCharacter) in column \(j)")
                if sudokuSet.contains(column) {
                    return false
                } else {
                    sudokuSet.insert(column)
                }
                
                let box = ("\(currCharacter) in column \(j/3) & \(i/3)")
                print("\(box) [\(i/3)][\(j/3)]")
                if sudokuSet.contains(box) {
                    return false
                } else {
                    sudokuSet.insert(box)
                }
            }
            
        }
    }
    return true
}

print(isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]))
