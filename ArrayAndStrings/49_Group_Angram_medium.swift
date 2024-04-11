import UIKit
/*
 Trick to solve anagrams is with dictionary and sorting
 When each string is sorted, the anangram characters are same and we have to group them in array accordingly
 Although the time complexity here becomes O(m*nlogn)  as sorting is involved and we have to loop through the string of array once. But this is the best and optimal solution as dictionary is way fast.
 */
func groupAnagramsWithDictionary(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else { return [] }
    
    var dict: [String: [String]] = [ : ]

    for str in strs {
        let sortedStr = String(str.sorted())
        if dict[sortedStr] == nil {
            dict[sortedStr] = [str]
        } else {
            var previousCombo = dict[sortedStr]!
            previousCombo.append(str)
            dict[sortedStr] = previousCombo
        }
    }

    return Array(dict.values)
}


func groupAnagramsWithDictionaryGrouping(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else { return [] }
    
    var dict = Dictionary(grouping: strs, by: {String($0.sorted())})
    return Array(dict.values)
}

print(groupAnagramsWithDictionary(["eat","tea","tan","ate","nat","bat"]))
print(groupAnagramsWithDictionaryGrouping(["eat","tea","tan","ate","nat","bat"]))

