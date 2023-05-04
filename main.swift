import Foundation

let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmh[0], m = nmh[1], h = nmh[2] //마을 크기, 초기 체력, 증가하는 h양
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var milks = [(Int, Int)]()
var house = (0, 0)

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 1 {
      house = (i, j)
    } else if board[i][j] == 2 {
      milks.append((i, j))
    }
  }
}

var ans = 0

func dfs(nx: Int, ny: Int, hp: Int, milk: Int) {
  for (x, y) in milks {
    if board[x][y] == 2 {
      let dist = abs(nx - x) + abs(ny - y)
      if dist <= hp { //이후에 더 나아갈 수 있다면 (체력이 남아있다면) 
          board[x][y] = 0
          dfs(nx: x, ny: y, hp: hp + h - dist, milk: milk + 1)
          board[x][y] = 2
      }
    }
}

  if abs(nx - house.0) + abs(ny - house.1) <= hp {
      ans = max(ans, milk)
  }
}

dfs(nx: house.0, ny: house.1, hp: m, milk: 0)
print(ans)