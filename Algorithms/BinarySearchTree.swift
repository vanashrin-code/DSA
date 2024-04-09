import UIKit
//       10
//       / \
//      5   14
//     /    / \
//    1    11  20

class Node {
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node? = nil, rightChild: Node? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let fiveNode =  Node(value: 5, leftChild: Node(value: 1))
let fourteenNode = Node(value: 14, leftChild: Node(value: 11), rightChild: Node(value: 20))
let tenNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)

func search(rootNode: Node?, value: Int) -> Bool {
    guard let node = rootNode else {
        return false
    }
    if node.value == value {
        return true
    } else if value > node.value {
        return search(rootNode: node.rightChild, value: value)
    } else {
        return search(rootNode: node.leftChild, value: value)
    }
}

print(search(rootNode: tenNode, value: 0))
