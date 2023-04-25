import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var board:[[Int]] = []
var dx = [-1, 1, 0, 0, -1, -1, 1, 1] //인접한 8방향
var dy = [0, 0, -1, 1, -1, 1, -1, 1]

var nx = 0
var ny = 0

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var shark:[(Int, Int)] = []
var answer = 0

for i in 0..<n {
  for j in 0..<m {
    if board[i][j] == 1 {
      shark.append((i, j))
    }
  }
}

func bfs() {
  while !shark.isEmpty {
    let (x, y) = shark.removeFirst()
    
    for i in 0..<8 {
      nx = x + dx[i]
      ny = y + dy[i]
  
      guard 0..<n ~= nx && 0..<m ~= ny else { continue }
  
      if board[nx][ny] == 0 {
        board[nx][ny] = board[x][y] + 1 //최단거리 -> 이전 수에 +1하기 
        shark.append((nx, ny))
        answer = max(answer, board[nx][ny])
      }
    }
  }
}

bfs()
print(answer-1)