
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count { return false }
    
    let s1Arr = Array(s1)
    let s2Arr = Array(s2)
    
    // create ascii array for s1 and s2 for 26 characters
    // initially set to zero
    var asciiS1 = Array(repeating: 0, count: 26)
    var asciiS2 = Array(repeating: 0, count: 26)
    var left = 0
    
    // 97 is ascii value for lower case "a"
    // switch indexes values for each characteres to 1
    s1Arr.forEach { asciiS1[Int($0.asciiValue ?? 0) - 97] += 1 }
    
    for (right, char) in s2Arr.enumerated() {
        asciiS2[Int(char.asciiValue ?? 0) - 97] += 1
        
        // convert the index values for characters in the window range to 1
        if right - left + 1 == s1Arr.count {
            if asciiS1 == asciiS2 {
                return true
            } else {
                // the values in the window doesn't match the values in the s1Arr,
                // increment the left pointer and make the value at left pointer to 0 again
                asciiS2[Int(s2Arr[left].asciiValue ?? 0) - 97] -= 1
                left += 1
            }
        }
    }
    return false
}

print(checkInclusion("ab", "eidbaooo"))
