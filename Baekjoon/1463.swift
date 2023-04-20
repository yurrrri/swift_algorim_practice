import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating:0, count: n+1)

if n == 1 {
  print(dp[n])
  exit(0)
}

for i in 2...n {
  dp[i] = dp[i-1] + 1
  
  if i%2 == 0 {
    dp[i] = min(dp[i], dp[i/2]+1) //1을 뺀것과 2로 나눈 연산 중 최솟값 구한 다음
  }

  if i%3 == 0 {
    dp[i] = min(dp[i], dp[i/3]+1) //위 최소값과 3으로 나눈 연산 중 최솟값 구하기
  }
}

print(dp[n])