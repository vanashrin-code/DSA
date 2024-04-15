import UIKit

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    var mutableGrid = grid
    
    var noOfIslands = 0
    //rows
    for i in 0..<mutableGrid.count {
        //columns
        for j in 0..<mutableGrid[0].count {
            // we are only interested in land so checking "1"
            if mutableGrid[i][j] == "1" {
                // do reccursive search
                noOfIslands += count(&mutableGrid, i, j)
            }
        }
    }
    
    return noOfIslands
}

func count(_ grid: inout [[Character]], _ i: Int, _ j: Int) -> Int {
    if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count {
        return 0
    }
    if grid[i][j] == "0" { return 0 }
    
    grid[i][j] = "0" // marking visited
    count(&grid, i+1, j)
    count(&grid, i-1, j)
    count(&grid, i, j+1)
    count(&grid, i, j-1)
    return 1
}
