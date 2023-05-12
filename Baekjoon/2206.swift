import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

var board:[[Int]] = []
for _ in 0..<n {
  board.append(readLine()!.map { Int(String($0))! })
}
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n) //각 좌표별로 벽을 부순 경우와 안부순 경우를 저장해둠
var result = -1

func bfs() {
  var q = [(0, 0, 0)] //세번째 원소의 의미 : 벽을 부셨느냐 안부셨느냐
  visited[0][0][0] = 1 // 첫번째는 1에서 시작하여 경로 셈
  var idx = 0
  
  while idx < q.count {
    let (x, y, wall) = q[idx]

    if x == n-1 && y == m-1 {
      result = visited[x][y][wall]
      break
    }

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<m ~= ny && visited[nx][ny][wall] == 0 else { continue }
      
      if board[nx][ny] == 0 { // 길 + 1
        // 여기서는 wall이 0인지 1인지 따질 필요가 없음
        // 1이면 벽이 이미 1개가 부숴졌을 때의 경로를 평행세계로 저장하고, 0이면 벽이 아직 부숴지지 않았을 때의 경로를 저장하는 것이기 때문
        visited[nx][ny][wall] = visited[x][y][wall] + 1
        q.append((nx, ny, wall))
      }
      // 아직 벽이 부숴지지 않은 경우 + 벽이라면
      else if board[nx][ny] == 1 && wall == 0 { 
        visited[nx][ny][1] = visited[x][y][0] + 1
        q.append((nx, ny, 1))
      }
    }
    idx += 1
  }
}

bfs()
print(result)