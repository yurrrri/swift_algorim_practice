import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]

var visited = Array(repeating: false, count: 100001)

func bfs() {
  var q = [(n, 0)]

  while !q.isEmpty {
    let num = q.removeFirst()
    if num.0 == k {
      print(num.1)
      break
    }

    print(num)

    if 0...100000 ~= 2*num.0 && !visited[2*num.0] { //0-1 BFS : 가중치가 0과 1인 간선만 존재할 경우에 가중치가 0인 간선이 맨 앞단에 위치해야하는 알고리즘
      q.insert((2*num.0, num.1), at: 0)
      visited[2*num.0] = true
    }

    if 0...100000 ~= num.0-1 && !visited[num.0-1]{
      q.append((num.0-1, num.1+1))
      visited[num.0-1] = true
    }

    if 0...100000 ~= num.0+1 && !visited[num.0+1] {
      q.append((num.0+1, num.1+1))
      visited[num.0+1] = true
    }

  }
}

bfs()