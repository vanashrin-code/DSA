import UIKit
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else { return []}
    
    var queue = [root]
    var results:[[Int]] = []
    var counter = 0
    
    while(!queue.isEmpty) {
        var currLevel : [Int] = []
        
        for i in 0..<queue.count {
            let currNode = queue.removeFirst()
            
            if currNode?.left != nil {
                queue.append(currNode?.left)
            }
            
            if currNode?.right != nil {
                queue.append(currNode?.right)
            }
            
            if counter % 2 == 0 {
                currLevel.append(currNode!.val)
            } else {
                currLevel.insert(currNode!.val, at: 0) // []20, 9]
            }
        }
        counter += 1
        results.append(currLevel)
    }
    return results
}
