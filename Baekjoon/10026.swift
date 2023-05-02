import Foundation

let n = Int(readLine()!)!
var board:[[String]] = []

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var green = 0
var blue = 0
var red = 0

var weak_blue = 0
var weak_red = 0

var nx = 0
var ny = 0

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var visited = Array(repeating: Array(repeating: false, count:n), count:n)

//bfs
func bfs(_ v: (Int, Int), _ color: String) {
  let (x, y) = v
  visited[x][y] = true
  var q = [(x, y)]

  while !q.isEmpty {
    let (x, y)  = q.removeFirst()

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<n ~= ny && !visited[nx][ny] && board[nx][ny] == color else { continue }

      visited[nx][ny] = true
      q.append((nx, ny))
    }
  }
}

//dfs
func dfs(_ v: (Int, Int), _ color:String) {
  let (x, y) = v
  visited[x][y] = true

  for i in 0..<4 {
    nx = x + dx[i]
    ny = y + dy[i]
    
    guard 0..<n ~= nx && 0..<n ~= ny && !visited[nx][ny] && board[nx][ny] == color else { continue }

    dfs((nx, ny), color)
  }
}

for i in 0..<n {
  for j in 0..<n {
    if !visited[i][j] {
      if board[i][j] == "R" {
        dfs((i, j), "R")
        red += 1
      } else if board[i][j] == "B" {
        dfs((i, j), "B")
        blue += 1
      } else {
        dfs((i, j), "G")
        green += 1
      }
    }
  }
}

visited = Array(repeating: Array(repeating: false, count:n), count:n)

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == "G" {
      board[i][j] = "R"
    }
  }
}

for i in 0..<n {
  for j in 0..<n {
    if !visited[i][j] {
      if board[i][j] == "R" {
        dfs((i, j), "R")
        weak_red += 1
      } else {
        dfs((i, j), "B")
        weak_blue += 1
      }
    }
  }
}

print(red+blue+green)
print(weak_red+weak_blue)