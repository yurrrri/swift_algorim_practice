import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating:0, count:5001)

dp[3] = 1
dp[5] = 1

for i in 3...n {
  if i % 3 == 0 { //3이나 5로 나누어진다는 것은 3이나 5를 뺀 DP 테이블 값에 3이나 5 설탕 봉지 1개를 더한다는 의미
    dp[i] = dp[i-3] + 1
  } else if i % 5 == 0 {
    dp[i] = dp[i-5] + 1
  }

  if dp[i-3] > 0 && dp[i-5] > 0 {
    if dp[i] != 0 {
      dp[i] = min(min(dp[i - 3], dp[i - 5]) + 1, dp[i]) //3과 5 조합 + 나눗셈 조합 중 선택
    } else {
      dp[i] = min(dp[i - 3], dp[i - 5]) + 1 //3과 5 조합 중 더 작은것 선택
    }
  }
}

if dp[n] != 0 {
  print(dp[n])
} else {
  print(-1)
}