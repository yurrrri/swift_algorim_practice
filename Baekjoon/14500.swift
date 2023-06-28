import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}

let dx = [0, 0, 1, -1] // 차례대로 상 하 좌 우
let dy = [1, -1, 0, 0]

var visited = Array(repeating: Array(repeating: false, count:m), count: n)
var maxValue = 0

func simul1(_ x: Int, _ y: Int, _ depth: Int, _ sum: Int) { // ㅗ, ㅜ, ㅓ, ㅏ 제외한 모든 모양 -> 어차피 다 상하좌우로 얻어짐
  if depth == 4 {
    maxValue = max(maxValue, sum)
    return
  }

  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]

    guard 0..<n ~= nx && 0..<m ~= ny && !visited[nx][ny] else { continue }

    visited[nx][ny] = true
    simul1(nx, ny, depth+1, sum + board[nx][ny])
    visited[nx][ny] = false
  }
}

func simul2(_ x: Int, _ y: Int) { // ㅗ, ㅜ, ㅓ, ㅏ
  for i in 0..<4 {
    var tmp = board[x][y]

    for k in 0..<3 {
      let t = (i+k)%4
      let nx = x + dx[t]
      let ny = y + dy[t]

      if !(0..<n ~= nx && 0..<m ~= ny) {
        tmp = 0 // 최대값에 포함 안되게 tmp 0으로 초기화
        break
      }

      tmp += board[nx][ny]
    }

    maxValue = max(maxValue, tmp)
  }
}

for i in 0..<n {
  for j in 0..<m {
    visited[i][j] = true
    simul1(i, j, 1, board[i][j])
    visited[i][j] = false

    simul2(i, j)  // visited 처리 안하는 이유 -> 겹치는 부분이 어차피 없음
  }
}

print(maxValue)