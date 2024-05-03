import UIKit
// use dictionary to store the character count
// The idea hear is to keep on increasing the window until the end of the string
// keep checking if the window is valid by checking the windowLength - maximum frequency of the character in the window is less than or equals to the given k
// else increment the left pointer and shrink the size of the window
// Time complexity will be O(26*n) i.e O(n) since there will maximum 26 characters


func characterReplacement(_ s: String, _ k: Int) -> Int {
    guard !s.isEmpty else { return 0 }
    
    let strArray = Array(s)
    var freqMap = [Character: Int]() // to store the frequency in which each characte appear
    var l = 0 // left pointer
    var res = 0 // result
    
    var maxFreq = 0
    
    // right pointer from 0 -> strArray.count
    for r in 0..<strArray.count {
        freqMap[strArray[r], default: 0] += 1 // increment the counter of character default with 1

        maxFreq = max(maxFreq, freqMap[strArray[r]]!)
        
        while (r - l + 1) - maxFreq > k {
            freqMap[strArray[l], default: 0] -= 1
            l += 1
        }
        res = max(res, (r - l + 1))
    }
    return res
}

print(characterReplacement("ABAB", 2))
