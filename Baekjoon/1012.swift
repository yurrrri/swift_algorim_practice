import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let t = Int(readLine()!)!

func dfs(_ v: (Int, Int), _ visited: inout [[Bool]], _ board:[[Int]]) {
  visited[(v.0)][(v.1)] = true

  for i in 0..<4 {
    nx = v.0 + dx[i]
    ny = v.1 + dy[i]

    if 0..<board.count ~= nx && 0..<board[0].count ~= ny && !visited[nx][ny] && board[nx][ny] == 1 {
      dfs((nx, ny), &visited, board)
    }
  }
}

for _ in 0..<t {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let m = input[0], n = input[1], k = input[2]
  var board = Array(repeating: Array(repeating: 0, count:m), count: n)
  var visited = Array(repeating: Array(repeating: false, count:m), count: n)
  var answer = 0

  for _ in 0..<k {
    let inputs = readLine()!.split(separator:" ").map { Int(String($0))! }
    board[inputs[1]][inputs[0]] = 1 //예제에서는 x, y 개념이 거꾸로임
  }

  for y in 0..<n {
    for x in 0..<m {
      if board[y][x] == 1 && !visited[y][x] {
        dfs((y, x), &visited, board)
        answer += 1
      }
    }
  }

  print(answer)
}