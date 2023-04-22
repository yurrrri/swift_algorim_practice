import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1] //n: 세로 m: 가로

var board:[[Int]] = []
var answer = 0

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

func dfs(_ v: (Int, Int), _ board: inout [[Int]]) {
  let (x, y) = v

  for i in 0..<4 {
    nx = x + dx[i]
    ny = y + dy[i]

    guard 0..<n ~= nx && 0..<m ~= ny else { return }

    if board[nx][ny] == 0 {
      board[nx][ny] = 2
      dfs((nx, ny), &board)
    }
  }
}

func countSafeArea(_ board:[[Int]]) -> Int {
  var count = 0
  
  for i in 0..<n {
    for j in 0..<m {
      if board[i][j] == 0 {
        count += 1
      }
    }
  }
  return count
}

func backtracking(_ depth: Int, _ board:inout [[Int]]) {
  if depth == 3 {
    var copied = board
    for i in 0..<n {
      for j in 0..<m {
        if copied[i][j] == 2 {
          dfs((i, j), &copied) //dfs 진행 후
        }
      }
    }

    answer = max(answer, countSafeArea(copied))
    
    return
  }

  for i in 0..<n {
    for j in 0..<m {
      if board[i][j] == 0 {
        board[i][j] = 1
        backtracking(depth+1, &board)
        board[i][j] = 0
      }
    }
  }
}

backtracking(0, &board)
print(answer)