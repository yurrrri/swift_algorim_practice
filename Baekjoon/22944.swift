//https://jisunshine.tistory.com/183
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
//false로 만드면 안되는 이유는, 더 많은 목숨으로 더 많이 나아갈 수 있는 경우의 수를 처리하지 못함

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var q:[(Int, Int, Int, Int, Int)] = []
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

      var nxtH = nowH // 따로 체력과 내구성을 계산하는 이유? -> 탐색을 돌때마다가 아닌 노드마다 경우의 수를 따져야함
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

      if nxtH == 0 { continue } //체력이 0인 경우는 더이상 탐색하지 않아야하므로 큐에 탐색 경로 추가 X
      if visited[nx][ny] < nxtH {  //이거 안쓰면 시간초과 남
        visited[nx][ny] = nxtH //더 많이 E에 도달할 수 있도록 현재 남아있는 체력이 더 클 경우에 해당 체력으로 바꿔줌
        q.append((nx, ny, nxtH, nxtD, c+1))
      }
    }
    idx += 1
  }
}

bfs()
print(-1)