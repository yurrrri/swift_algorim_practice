import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var board:[[Int]] = []
for i in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var copied:[[Int]] = []

var chicken:[(Int, Int)] = []
var house:[(Int, Int)] = []

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 2 {
      chicken.append((i, j))
      board[i][j] = 0
    } else if board[i][j] == 1 {
      house.append((i, j))
      board[i][j] = 0
    }
  }
}

var answer = Int.max

func dfs(_ chicken: inout [(Int, Int)]) {
  while !chicken.isEmpty {
    let (x, y) = chicken.removeFirst()

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<n ~= ny else { continue }

      if copied[nx][ny] != 2 {
        copied[nx][ny] = copied[x][y] + 1
        chicken.append((nx, ny))
        answer = min(answer, copied[nx][ny])
      }
    }
  }
}

func combination(_ nums:[(Int, Int)], _ m:Int) -> [[(Int, Int)]] {
  var result:[[(Int, Int)]] = []

  func combi(_ arr:[(Int, Int)]) {
    if arr.count == m {
      result.append(arr)
      return
    }

    for i in 0..<m {
      combi(arr + [nums[i]])
    }
  }
}

for i in 1...m {
  var result = combination(chicken, i)
  for j in result {
    copied = board
    for (x, y) in j {
      copied[x][y] = 2
    }
    dfs(j)
  }
}

print(answer)