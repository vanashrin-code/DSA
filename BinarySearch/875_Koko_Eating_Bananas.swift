import UIKit

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    // eg. [3,6,7,11], h = 8
    // if we consider koko's min speed
    // 1 -> then koko will take 3 hours to complete 1st pile,
    //                          6 hours to complete 2nd and so on
    //      but hours are only 8
    // if we consider best case scenario as 11 min speed of koko,
    // i.e if koko eats 11 bananas in an hour, we got still 10 hours left
    // so we have a range of [1..11]
    // we can use binary search to go through each of these speed levels
    
    guard !piles.isEmpty else { return 0 }
    
    // hence we consider here min speed as 1 and max speed as 11 as per above example
    var minSpeed = 1, maxSpeed = piles.max()! // largest pile in the array
    
    while minSpeed < maxSpeed {
        let mid = minSpeed + (maxSpeed - minSpeed) / 2
        
        // we have to check here what is the nearest speed which can be used as a result,
        // so pass mid value to this function
        if(canFinish(piles, mid, h)) {
            maxSpeed = mid
        } else {
            minSpeed = mid + 1
        }
    }
    return minSpeed
    
    func canFinish(_ piles: [Int], _ speed: Int, _ h: Int) -> Bool {
        var hours = 0
        for pile in piles {
            // for eg in case of 6 minSpeed,
            // we check with each pile
            // [3/6, 6/6, 7/6, 11/6 ]
            // we still have to spend 1 hr in each pile
            // so we get 1, 1, 2, 2 =  6
            // in this case we have still 2 more hrs left
            hours += Int(ceil(Double(pile) / Double(speed)))
        }
        return hours <= h
    }
}

// piles = [3,6,7,11], h = 8

print(minEatingSpeed([3,6,7,11], 8))
