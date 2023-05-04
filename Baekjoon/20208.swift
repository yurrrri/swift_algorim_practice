import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1], h = input[2]

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

var board:[[Int]] = []
for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var house:(Int, Int) = (0, 0)

loop: for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 1 {
      house = (i, j)
      break loop
    }
  }
}

var q = [(house.0, house.1, m, 0)] // x/y 좌표, 초기체력, 민초 개수
var visited = Array(repeating: Array(repeating:0, count:n), count: n)
var answer = 0

func bfs(){
  visited[house.0][house.1] = true

  while !q.isEmpty {
    let (x, y, curM, curC) = q.removeFirst()

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<n ~= ny else { continue }

      var nxtM = curM
      var nxtC = curC

      if !visited[nx][ny] {
        if board[nx][ny] == 0 {
          nxtM -= 1
        } else if board[nx][ny] == 2 {
          nxtC += 1
          nxtM += h - 1
        }
      }

      if board[nx][ny] == 1 {
        answer = max(answer, nxtC)
      }

      if nxtM == 0 { continue } //체력이 0이되는 순간 그 다음으로 이동할 수 없음

      board[nx][ny] = nxtM
      q.append((nx, ny, nxtM, nxtC))
      
    }
  }
}

print(answer)