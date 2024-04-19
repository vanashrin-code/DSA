import UIKit

func isPalindrome(_ s: String) -> Bool {
    guard s.count >= 1 else { return true }
    
    let strArray = Array(s.lowercased()).filter { $0.isLetter || $0.isNumber }
    var startPtr = 0
    var endPtr = strArray.count - 1
    
    while startPtr < endPtr {
        if strArray[startPtr] != strArray[endPtr] { return false }
        
        startPtr += 1
        endPtr -= 1
    }
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
