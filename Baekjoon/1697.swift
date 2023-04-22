import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]
var visited = Array(repeating:false, count:100001)

var nx = 0

func bfs() {
  var q = [(n, 0)]
  visited[n] = true

  while !q.isEmpty {
    let (x, time) = q.removeFirst()

    if x == k {
      print(time)
      break
    }

    for i in [x-1, x+1, 2*x] {
      if 0...100000 ~= i && !visited[i] {
        q.append((i, time+1))
        visited[i] = true
      }
    }
  }
}

bfs()
print()