import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count:n), count:n) 
var board:[[Int]] = []
for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}
dp[0][0] = 1

func validBound(_ i:Int, _ num: Int) -> Bool {
  if i + num < n {
    return true
  } else {
    return false
  }
}

// DP 테이블: i와 j까지 갈 수 있는 경로의 수
for i in 0..<n {
  for j in 0..<n {
    if i == n-1 && j == n-1 {
      print(dp[i][j])
      break
    }
    
    if validBound(i, board[i][j]) {
      dp[i+board[i][j]][j] += dp[i][j]
    }
    // dp[i][j]에 이미 i와 j까지 가기까지의 경로가 있으므로, 해당 경로의 수를 더해주면 곧 경우의 수가 됨

    if validBound(j, board[i][j]) {
      dp[i][j + board[i][j]] += dp[i][j]
    }
  }
}