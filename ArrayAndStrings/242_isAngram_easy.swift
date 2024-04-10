import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    // Sorting Solution with time complexity O(nlogn)
    /*
     let sSorted = s.sorted()
     let tSorted = t.sorted()
     
     return sSorted == tSorted
     */
    
    // Inbuilt dictionary with time complexity of O(n)
    
    /*
     let sDict = Dictionary(grouping: s, by: {$0})
     let tDict = Dictionary(grouping: t, by: {$0})
     
     return sDict == tDict
     */
    
    //Dictionary solution with less runtime. Time complexity of O(n)
    var sDict: [Character: Int] = [ : ]
    var tDict: [Character: Int] = [ : ]
    
    for c in s {
        sDict[c] = (sDict[c] ?? 0) + 1
    }
    
    for c in t {
        tDict[c] = (tDict[c] ?? 0) + 1
    }
    
    for (key, value) in sDict {
        if let tValue = tDict[key], tValue == value {
            continue
        } else {
            return false
        }
    }
    return true
    
}

isAnagram("anagram", "nagaram")
isAnagram("rat", "car")
