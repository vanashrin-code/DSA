import UIKit
/*
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var freqMap = [Int: Int]()
    
    for num in nums {
        freqMap[num, default: 0] += 1
    }
    
    var buckets = Array(repeating: [Int](), count: nums.count + 1)
    for (num, freq) in freqMap {
        buckets[freq].append(num)
    }
    
    print(buckets)
    var result = [Int]()
    for i in (0 ..< buckets.count).reversed() {
        result += buckets[i]
        if result.count == k {
            break
        }
    }
    
    return result
}
 */

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    if nums.count <= 1 { return nums }
    
    var freqMap = [Int: Int]()
    
    // freqMap = [1:3, 2:2, 3:1]
    for num in nums {
        freqMap[num, default: 0] += 1
    }
    
    // buckets = [[],[],[],[],[],[],[]]
    var buckets = Array(repeating: [Int](), count: nums.count + 1)
    for (num, freq) in freqMap {
        buckets[freq].append(num)
    }
    //           [ 0, 1,  2,  3, 4, 5, 6]
    // buckets = [[],[3],[2],[1],[],[],[]]
    
    var result = [Int]()
    for i in (0..<buckets.count).reversed() // [[1],[2],[3],[],[],[],[]]
    {
        result += buckets[i]
        if result.count >= k {
            break
        }
    }
    return result // [1, 2]
}

topKFrequent([1,1,1,2,2,3], 2)
