import Foundation

let dx = [0, 0, -1, 1, -1, 1, -1, 1]
let dy = [-1, 1, 0, 0, -1, -1, 1, 1]

var nx = 0
var ny = 0

while true {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  if input == [0, 0] {
    break
  }
  
  let w = input[0], h = input[1]
  var board:[[Int]] = []
  var visited = Array(repeating: Array(repeating: false, count:w), count: h)

  for _ in 0..<h {
    board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
  }

  func dfs(_ x: Int, _ y: Int) {
    visited[x][y] = true
  
    for i in 0..<8 {
      nx = x + dx[i]
      ny = y + dy[i]
  
      if 0..<h ~= nx && 0..<w ~= ny && !visited[nx][ny] && board[nx][ny] == 1 {
        dfs(nx, ny)
      }
    }
  }

  var answer = 0
  for i in 0..<h {
    for j in 0..<w {
      if board[i][j] == 1 && !visited[i][j] {
        dfs(i, j)
        answer += 1
      }
    }
  }
  print(answer)
}