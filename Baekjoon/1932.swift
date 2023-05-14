import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  for j in 0..<input.count {
    dp[i][j] = input[j]
  }
}

if n == 1 {
  print(dp[0][0])
  exit(0)
}

for i in 1..<n { //두번째줄부터 시작
  for j in 0...i {
    if j == 0{
      dp[i][0] = dp[i][0] + dp[i-1][0]
    }
    else if j == i {
      dp[i][j] = dp[i][j] + dp[i-1][j-1]
    } else {
      dp[i][j] = dp[i][j] + max(dp[i-1][j-1], dp[i-1][j])
    }
  }
}

print(dp[n-1].max()!)