import UIKit

class TimeMap {
    private var store: [String : [StoreData]] = [:]
    init() {
        
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if store[key] != nil {
            store[key]?.append(StoreData(value: value, timestamp: timestamp))
        } else {
            store[key] = [StoreData(value: value, timestamp: timestamp)]
        }
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let value = store[key] else { return "" }
        
        // binary search
        var l = 0, r = value.count - 1
        while l < r {
            let mid = (l + r + 1) / 2
            if value[mid].timestamp <= timestamp {
                l = mid
            } else {
                 r = mid - 1
            }
        }
        if value[l].timestamp > timestamp {
            return ""
        } else {
            return value[l].value
        }
    }
}

public struct StoreData {
    let value: String
    let timestamp: Int
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */
