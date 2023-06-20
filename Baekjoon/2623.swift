import Foundation

let nm = readLine()!.split(separator:" ").map { Int($0)! }
let n = nm[0], m = nm[1]

var indegree = Array(repeating: 0, count:n+1)
var graph:[[Int]] = Array(repeating: [], count:n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  for i in 1..<input[0]-1 {
    graph[input[i]].append(input[i+1])
    indegree[input[i+1]] += 1
  }
}

func topologySort() {
  var result:[Int] = []
  var q:[Int] = []

  for i in 1...n {
    if indegree[i] == 0 {
      q.append(i)
    }
  }

  while !q.isEmpty {
    let now = q.removeFirst()
    result.append(now)

    for i in graph[now] {
      indegree[i] -= 1

      if indegree[i] == 0 {
        q.append(i)
      }
    }
  }

  if result.count != n { // 순서를 정하는것이 불가능한 경우 (result에 없는 가수가 있을 때)
    print(0)
  } else {
    for i in result {
      print(i)
    }
  }
}

topologySort()