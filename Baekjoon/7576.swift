import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]
var board:[[Int]] = []
var q:[(Int, Int)] = []
var idx = 0
var lastIdx = (0, 0)

for _ in 0..<m {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

func findTomato(_ board: [[Int]]) {
  for i in 0..<m {
    for j in 0..<n {
      if board[i][j] == 1 {
        q.append((i, j))
      }
    }
  }
}

func bfs() {
  while idx < q.count{ //BFS에서 시간줄이는 방법 -> removeFirst 말고 배열로 접근
    let (x, y) = q[idx]
    idx += 1

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      if 0..<m ~= nx && 0..<n ~= ny && board[nx][ny] == 0 {
        board[nx][ny] = board[x][y] + 1
        q.append((nx, ny))
        lastIdx = (nx, ny) //아래에서 맨 마지막일 때의 값(최단경로, 최소일수)을 출력하기 위함
      }
    }
  }
}

findTomato(board)
bfs()

if board.flatMap { $0 }.contains(0) { //이게 반복문으로 찾는거보다 시간많이걸림
  print(-1)
}
else{
  print(board[lastIdx.0][lastIdx.1]-1)
}