import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]

var nx = 1

var visited = Array(repeating:0, count:101)
var board = Array(repeating:0, count:101)

for _ in 0..<(n+m) {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  board[input[0]] = input[1]
}

func bfs() {
  var q = [1]

  while !q.isEmpty {
    let x = q.removeFirst()

    for i in 1...6 {
      nx = x + i
      
      if nx >= 101 { //100번까지는 visited를 계산해야함
        break
      }

      let next_pos = board[nx] == 0 ? nx : board[nx]

      if visited[next_pos] == 0 {
        q.append(next_pos)
        visited[next_pos] = visited[x] + 1
      }
    }
  }
}

bfs()
print(visited[100])