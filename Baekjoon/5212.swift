//실패한 코드
import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let r = input[0], c = input[1]
var board:[[String]] = []

for _ in 0..<r {
  board.append(readLine()!.map { String($0)})
}
var island:[(Int, Int)] = []

for i in 0..<r {
  for j in 0..<c {
    if board[i][j] == "X" {
      island.append((i, j))
    }
  }
}

var nx = 0
var ny = 0

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var copied = board

func bfs(){
  while !island.isEmpty {
    let (x, y) = island.removeFirst()
    var count = 0

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      if 0..<r ~= nx && 0..<c ~= ny {
        if board[nx][ny] == "." {
          count += 1
        }
      } else {
        count += 1
      }
    }

    if count >= 3 {
      copied[x][y] = "."
    }
  }
}

bfs()

var min_row = Int.max //섬이 시작되는 시작 행
var max_row = 0 //끝나는 행
var min_col = Int.max //섬이 시작되는 시작 열
var max_col = 0 //끝나는 열

for i in 0..<r {
  for j in 0..<c {
    if copied[i][j] == "X" {
      min_row = min(min_row, i)
      max_row = max(max_row, i)

      min_col = min(min_col, j)
      max_col = max(max_col, j)
    }
  }
}

for i in min_row...max_row {
  for j in min_col...max_col {
    print(copied[i][j], terminator:"")
  }
  print()
}