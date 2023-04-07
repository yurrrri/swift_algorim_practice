let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count:n+1)

dp[1] = 1 //1, 2 초기값 지정
dp[2] = 1

if n >= 3 {
  for i in 3...n {
	 dp[i] = dp[i-1] + dp[i-2]
  }
}

print(dp[n])