import UIKit

/*
 We have a two-dimensional board game involving snakes.  The board has two types of squares on it: +'s represent impassable squares where snakes cannot go, and 0's represent squares through which snakes can move.
 
 Snakes may move in any of four directions - up, down, left, or right - one square at a time, but they will never return to a square that they've already visited.  If a snake enters the board on an edge square, we want to catch it at a different exit square on the board's edge.
 
 The snake is familiar with the board and will take the route to the nearest reachable exit, in terms of the number of squares it has to move through to get there. Note that there may not be a reachable exit.
 
 Here is an example board:
 
 col-->        0  1  2  3  4  5  6  7  8
 +---------------------------
 row      0 |  +  +  +  +  +  +  +  0  0
 |        1 |  +  +  0  0  0  0  0  +  +
 |        2 |  0  0  0  0  0  +  +  0  +
 v        3 |  +  +  0  +  +  +  +  0  0
          4 |  +  +  0  0  0  0  0  0  +
          5 |  +  +  0  +  +  0  +  0  +
 
 Write a function that takes a rectangular board with only +'s and O's, along with a starting point on the edge of the board, and returns the coordinates of the nearest exit to which it can travel.  If there is a tie, return any of the nearest exits.
 -----------------------------------------------------
 Sample inputs:
 board1 = [['+', '+', '+', '+', '+', '+', '+', '0', '0'],
           ['+', '+', '0', '0', '0', '0', '0', '+', '+'],
           ['0', '0', '0', '0', '0', '+', '+', '0', '+'],
           ['+', '+', '0', '+', '+', '+', '+', '0', '0'],
           ['+', '+', '0', '0', '0', '0', '0', '0', '+'],
           ['+', '+', '0', '+', '+', '0', '+', '0', '+']]
 start1_1 = (2, 0) # Expected output = (5, 2)
 start1_2 = (0, 7) # Expected output = (0, 8)
 start1_3 = (5, 2) # Expected output = (2, 0) or (5, 5)
 start1_4 = (5, 5) # Expected output = (5, 7)
 */


func findExit(matrix: [[String]], start: [Int]) -> (Int, Int) {
    var matrix = matrix
    var result = [(Int, Int, Int)]()
    
    var toVisitQueue: [(Int, Int, Int)] = [(start.first!, start.last!, 0)]
    let directions = [(1,0), (0, 1), (-1, 0), (0, -1)]
    
    while !toVisitQueue.isEmpty {
        let (x, y, step) = toVisitQueue.removeFirst()
        
        if (x,y) != (start[0], start[1]) && isExit(position: (x, y)) {
            result.append((x, y, step))
        }
        
        for direction in directions {
            let x = x + direction.0
            let y = y + direction.1
            
            if isValidPosition(position: (x, y)) && matrix[x][y] == "0" {
                matrix[x][y] = "+"
                toVisitQueue.append((x, y, step + 1))
            }
        }
    }

    let res = result.min { $0.2 < $1.2 }
    return (res!.0, res!.1)
    
    func isExit(position: (Int, Int)) -> Bool {
        let x = position.0
        let y = position.1
        
        return x == 0 || x == matrix.count - 1 || y == 0 || y == matrix[0].count - 1
    }
    
    func isValidPosition(position: (Int, Int)) -> Bool {
        let x = position.0
        let y = position.1
        return x >= 0 && x < matrix.count && y >= 0 && y < matrix[0].count
    }
}



let straightBoard1 = [["+", "0", "+", "0", "+",],
                      ["0", "0", "+", "0", "0",],
                      ["+", "0", "+", "0", "+",],
                      ["0", "0", "+", "0", "0",],
                      ["+", "0", "+", "0", "+"]]
print(findExit(matrix: straightBoard1, start: [0, 1]))
print(findExit(matrix: straightBoard1, start: [4, 1]))
