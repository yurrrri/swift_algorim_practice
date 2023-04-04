import Foundation

let n = Int(readLine()!)!
var graph:[[Int]] = Array(repeating:[], count:n+1)
var answer = Array(repeating:1, count:n+1)

for _ in 0..<n-1 {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let n = input[0], m = input[1]

  graph[n].append(m)
  graph[m].append(n)
}

var visited = Array(repeating:false, count:n+1)

func bfs(_ graph:[[Int]], _ v: Int){
  var q:[Int] = [v]
  visited[v] = true

  while !q.isEmpty {
    let v = q.removeFirst()

    for i in graph[v] {
      if !visited[i] {

        answer[i] = v
        
        q.append(i)
        visited[i] = true
      }
    }
  }
}

bfs(graph, 1)

print(Array(answer[2...n]).map { String($0) }.joined(separator:"\n"))