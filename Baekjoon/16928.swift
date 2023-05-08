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

    if x == 100 {
      print(visited[100])
      break
    }

    for i in 1...6 {
      nx = x + i
      
      guard 1...100 ~= nx && visited[nx] == 0 else { continue }

      if board[nx] != 0 {
        q.append(board[nx])
      } else {
        q.append(nx)
      }
      visited[nx] = visited[x] + 1
    }
  }
}

bfs()