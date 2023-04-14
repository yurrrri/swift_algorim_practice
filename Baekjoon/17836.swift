let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1], t = input[2] //제한시간
var board:[[Int]] = []
var visited = Array(repeating: Array(repeating: false, count:m), count: n)

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var nx = 0
var ny = 0
var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]
var lastIndex = (0,0)
var count = 0

func bfs() {
  visited[0][0] = true
  var q = [(0, 0)]
  board[0][0] = 1

  while !q.isEmpty {
    let (x, y) = q.removeFirst()

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<m ~= ny else { continue } 
      
      if !finded && board[nx][ny] != 1 && !visited[nx][ny] {
        visited[nx][ny] = true
        q.append((nx, ny))
        if board[nx][ny] == 2 {
          finded = true
        }
        board[nx][ny] = board[x][y] + 1
        lastIndex = (nx, ny)
      } else if finded && !visited[nx][ny] {
        visited[nx][ny] = true
        q.append((nx, ny))
        board[nx][ny] = board[x][y] + 1
        lastIndex = (nx, ny)
      }
    }
  }
}

bfs()
print(board[lastIndex.0][lastIndex.1])