import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }
    var maxPr = 0
    var l = 0, r = 1
    
    while r < prices.count {
        if prices[r] < prices[l] {
            l = r
        } else {
            let profit = prices[r] - prices[l]
            maxPr = max(profit, maxPr)
        }
        r += 1
    }
    return maxPr
}

print(maxProfit([7,1,5,3,6,4]))
