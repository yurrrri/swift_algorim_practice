import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0]
var h = input[1]
let d = input[2]

var board:[[String]] = []
var visited = Array(repeating: Array(repeating: 0, count:n), count:n)

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var q:[(Int, Int, Int, Int, Int)] = [] //차례대로 좌표, 체력, 
loop: for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == "S" {
      q.append((i, j, h, 0, 0))
      visited[i][j] = h
      break loop
    }
  }
}

var naegudo = 0

func bfs() {
  var idx = 0
  
  while idx < q.count {
    let (x, y, nowH, nowD, c) = q[idx]

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<n ~= ny else { continue }

      var nxtH = nowH
      var nxtD = nowD

      if nxtD > 0 && board[nx][ny] == "." {
        nxtD -= 1
      }
      else if nxtD == 0 && board[nx][ny] == "." {
        nxtH -= 1
      } 
      else if board[nx][ny] == "U" {
        nxtD = d-1
      }
      else if board[nx][ny] == "E" {
        print(c+1)
        exit(0) 
      }

      if nxtH == 0 { continue }
      if visited[nx][ny] < nxtH {
        visited[nx][ny] = nxtH
        q.append((nx, ny, nxtH, nxtD, c+1))
      }
    }
    idx += 1
  }
}

bfs()
print(-1)