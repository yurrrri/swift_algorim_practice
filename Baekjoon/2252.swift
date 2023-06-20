import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

// 진입차수
var indegree = Array(repeating: 0, count:n+1)
var graph:[[Int]] = Array(repeating: [], count:n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let a = input[0], b = input[1]
  graph[a].append(b)  // 정점 A에서 B로 이동 가능
    // 진입차수를 1 증가
  indegree[b] += 1
}

func topologySort() {
  var result:[Int] = []
  var q:[Int] = []

  // 1. 진입차수가 0인 노드 큐에 삽입
  for i in 1...n {
    if indegree[i] == 0 {
      q.append(i)
    }
  }

  while !q.isEmpty {
    let now = q.removeFirst()
    result.append(now)

    // 2. 해당 원소와 연결된 노드 진입차수 -1
    for i in graph[now] {
      indegree[i] -= 1

      // 3. 진입차수가 0인 노드 큐에 삽입
      if indegree[i] == 0 {
        q.append(i)
      }
    }
  }

  for i in result {
    print(i, terminator:" ")
  }
}

topologySort()