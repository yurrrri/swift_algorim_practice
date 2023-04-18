import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]

var visited = Array(repeating: false, count: 100001)

func bfs() {
  var q = [(n, 0)]
  visited[n] = true

  while !q.isEmpty {
    let num = q.removeFirst()
    if num.0 == k {
      print(num.1)
      break
    }

    if 0...100000 ~= num.0-1 && !visited[num.0-1]{
      q.append((num.0-1, num.1+1))
      visited[num.0-1] = true
    }

    if 0...100000 ~= num.0+1 && !visited[num.0+1] {
      q.append((num.0+1, num.1+1))
      visited[num.0+1] = true
    }

    if 0...100000 ~= 2*num.0 && !visited[2*num.0] {
      q.append((2*num.0, num.1))
      visited[2*num.0] = true
    }
  }
}

bfs()