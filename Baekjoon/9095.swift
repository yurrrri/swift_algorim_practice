import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating:0, count:11) //n이 양수이며 1~10

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...10 {
  dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for _ in 0..<n {
  print(dp[Int(readLine()!)!])
}