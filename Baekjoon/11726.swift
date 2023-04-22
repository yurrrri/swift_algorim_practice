import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count:1001)

dp[1] = 1
dp[2] = 2

for i in 3...1000 {
  dp[i] = (dp[i-1] + dp[i-2]) % 10007
}

print(dp[n])