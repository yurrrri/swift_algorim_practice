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
print(copied)

var temp:[[String]] = []

//가로가 모두 "." 인 부분 날리기
for i in 0..<r{
  if copied[i].allSatisfy { $0 == "." } {
    continue
  }
  temp.append(copied[i])
}

//세로가 모두 "."인 부분 날리기
var min_val = Int.max
var max_val = 0

for i in 0..<temp.count {
  for j in 0..<temp[0].count {
    if temp[i][j] == "X" {
      min_val = min(min_val, j)
      max_val = max(max_val, j)
    }
  }
}

for i in 0..<temp.count {
  for j in min_val...max_val {
    print(temp[i][j], terminator:"")
  }
  print()
}