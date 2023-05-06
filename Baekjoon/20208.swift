//시간초과 코드
import Foundation

let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmh[0], m = nmh[1], h = nmh[2] //마을 크기, 초기 체력, 증가하는 h양
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count:n), count:n)

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

var answer = 0
//num: 초코우유 개수
func dfs(_ num: Int, _ x: Int, _ y: Int, _ hp: Int) {
  if hp - (abs(house.0-x) + abs(house.1-y)) >= 0 { //현재 체력으로 집으로 갈 수 있다면
    answer = max(answer, num)
  }

  for (i, j) in milks {
    if visited[i][j] { continue }
    let diff = hp - (abs(x-i) + abs(y-j))
    if diff < 0 { continue }

    visited[i][j] = true
    dfs(num+1, i, j, diff + h)
    visited[i][j] = false
  }
}

dfs(0, house.0, house.1, m)
print(answer)