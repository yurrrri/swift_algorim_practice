import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0]
let h = input[1] //체력
let d = input[2] //내구도

var board:[[String]] = []
var visited = Array(repeating: Array(repeating: 0, count:n), count:n) //방문했을 때의 체력을 담는 배열

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var q:[(Int, Int, Int, Int, Int)] = [] //차례대로 좌표, 체력, 거리
loop: for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == "S" {
      q.append((i, j, h, 0, 0))
      visited[i][j] = h
      break loop
    }
  }
}

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

      if nxtD > 0 && board[nx][ny] == "." { //우산 있음
        nxtD -= 1
      }
      else if nxtD == 0 && board[nx][ny] == "." { //우산 없음 -> 체력 -1
        nxtH -= 1
      } 
      else if board[nx][ny] == "U" { //우산 쓰고 비맞으므로 -1
        nxtD = d-1
      }
      else if board[nx][ny] == "E" {
        print(c+1)
        exit(0) 
      }

      if nxtH == 0 { continue } //체력이 0인 경우는 탐색 X
      if visited[nx][ny] < nxtH { 
        //이거 안쓰면 시간초과 남
        //체력이 현재 그 다음으로 나아갈 수 있을 경우에만 탐색하도록 조건을 검
        visited[nx][ny] = nxtH
        q.append((nx, ny, nxtH, nxtD, c+1))
      }
    }
    idx += 1
  }
}

bfs()
print(-1)