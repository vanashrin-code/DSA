import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else { return 0 }

    var l = 0, maxLen = 0
    
    var charCount: Set<Character> = []
    let characters = Array(s)
    
    for r in 0..<s.count {
            while charCount.contains(characters[r]) {
                charCount.remove(characters[l])
                l += 1
            }
            charCount.insert(characters[r])
            maxLen = max(maxLen, r - l + 1)
        }
    return maxLen
}

print(lengthOfLongestSubstring("pwwkew"))
