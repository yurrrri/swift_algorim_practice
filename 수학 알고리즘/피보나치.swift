var dp = [Int](repeating: 0, count:n+1)

dp[1] = 1 //1, 2 초기값 지정
dp[2] = 1

for i in 3...n {
	dp[n] = dp[n-1] + dp[n-2]
}

print(dp[n])