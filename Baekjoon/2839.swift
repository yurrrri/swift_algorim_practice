import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating:0, count:5001)

dp[3] = 1
dp[5] = 1

for i in 3...n{
  if i % 5 == 0{
      dp[i] = dp[i - 5] + 1
  }
  else if i % 3 == 0 {
      dp[i] = dp[i - 3] + 1
  }
  
  if dp[i - 3] > 0 && dp[i - 5] > 0 {
    if dp[i] != 0 {
      dp[i] = min(min(dp[i - 3], dp[i - 5]) + 1, dp[i])
    } else {
      dp[i] = min(dp[i - 3], dp[i - 5]) + 1
    }
  }
}

if dp[n] != 0 {
  print(dp[n])
} else {
  print(-1)
}