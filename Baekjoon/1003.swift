import Foundation

var dp = Array(repeating:(0, 0), count:41) //각각 0, 1 차례대로 튜플
dp[0] = (1, 0)
dp[1] = (0, 1)

for i in 2...40 {
  dp[i].0 = dp[i-1].0 + dp[i-2].0
  dp[i].1 = dp[i-1].1 + dp[i-2].1
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  print("\(dp[n].0) \(dp[n].1)")
}