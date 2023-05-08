import Foundation

var dp = Array(repeating: 0, count: 10001)

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 10001)

for i in 1...n {
  arr[i] = Int(readLine()!)!
}

dp[1] = arr[1]
dp[2] = arr[1] + arr[2]

if n > 2 {
  for i in 3...n {
    dp[i] = max(dp[i-3] + arr[i-1] + arr[i], dp[i-2] + arr[i], arr[i-1], dp[i-1])
  }
}

print(dp[n])