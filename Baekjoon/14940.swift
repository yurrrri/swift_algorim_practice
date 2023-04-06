import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1] //n:세로, m: 가로
var board:[[Int]] = []

for _ in 0..<n{
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var target = (0, 0)

var nx = 0
var ny = 0
var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

for i in 0..<n{
  for j in 0..<m {
    if board[i][j] == 2 {
      target = (i, j)
    }
  }
}

var visited = Array(repeating: Array(repeating:false, count:m), count:n)

func bfs() {
  var q = [target]
  board[target.0][target.1] = 0 //목표 지점은 0으로 초기화
  visited[target.0][target.1] = true

  while !q.isEmpty {
    let (x, y) = q.removeFirst()

    for i in 0..<4{
      nx = x + dx[i]
      ny = y + dy[i]

      if 0..<n ~= nx && 0..<m ~= ny && board[nx][ny] == 1 && !visited[nx][ny] {
        board[nx][ny] = board[x][y] + 1
        visited[nx][ny] = true
        q.append((nx, ny))
    }
  }
}
}

bfs()
for i in 0..<n{
  var answerString = ""
  for j in 0..<m{
    if !visited[i][j] && board[i][j] == 1 {
      answerString += "-1 "
    }
    else{
      answerString += "\(board[i][j]) "
    }
  }
  print(answerString)
}