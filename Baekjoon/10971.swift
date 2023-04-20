import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []
var answer = Int.max
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

func dfs(_ num: Int, _ sum: Int){
  if num == n {
    if sum < answer {
      answer = sum
    }
    return
  }

  for i in 0..<n {
    for j in 0..<n {
      if !visited[i][j] && board[i][j] != 0 {
        visited[i][j] = true
        dfs(num+1, sum+board[i][j])
        visited[i][j] = false
      }
    }
  }
}

dfs(0, 0)
print(answer)