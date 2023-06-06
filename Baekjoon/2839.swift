import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count:5001)

for i in 3...n {
  if i%3 == 0 {
    dp[i] = dp[i-3] + 1 // 3으로 나누어떨어질때  
  }

  if i%5 == 0 {
    if dp[i] != 0  {
      dp[i] = min(dp[i], dp[i-5]+1) // 위의 수와 5로 나누어떨어질때의 최소값 비교  
    } else {
      dp[i] = dp[i-5] + 1
    }
  }

  if dp[i-3] != 0 && dp[i-5] != 0 { // 3과 5의 조합으로 설탕을 가져갈 수 있을 때
    if dp[i] != 0 {
      dp[i] = min(dp[i], min(dp[i-3], dp[i-5])+1)
    } else {
      dp[i] = min(dp[i-3], dp[i-5])+1
    }
  }
}

if dp[n] == 0 {
  print(-1)
} else {
  print(dp[n])
}