import Foundation

let t = Int(readLine()!)!
var dp:[[Int]] = []
var n = 0

for _ in 0..<t {
  n = Int(readLine()!)!
  dp = []
  
  for _ in 0..<2 {
    dp.append(readLine()!.split(separator:" ").map { Int($0)! })
  }

  simulation()
}

func simulation() {
  if n == 1 {
    print(max(dp[0][0], dp[1][0]))
    return
  }
  dp[0][1] += dp[1][0]
  dp[1][1] += dp[0][0]

  for i in 2..<n {
    dp[0][i] += max(dp[1][i-1], dp[1][i-2]) 
    dp[1][i] += max(dp[0][i-1], dp[0][i-2])
    // 여기서 dp[0][i]가 dp[0][i-2]에 대한 고려가 없는 이유는, dp[1][i-1]에 dp[0][i-2]를 고려하여 최대값을 가지고있기 때문에 고려할 필요 X
  }
  print(dp.flatMap { $0 }.max()!)
}