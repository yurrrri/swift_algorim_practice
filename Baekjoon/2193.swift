import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

if n == 1 || n == 2 {
  print(1)
  exit(0)
} else {
  dp[1] = 1
  dp[2] = 1

  for i in 3...n {
    dp[i] = dp[i-1] + dp[i-2]
  }
}

print(dp[n])