import Foundation

let N = Int(readLine()!)! //정점 개수
let M = Int(readLine()!)! //간선 개수
var graph:[[Int]] = Array(repeating:[], count:N+1)
var visited = [Bool](repeating:false, count:N+1)

for _ in 0..<M {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  graph[input[0]].append(input[1])
  graph[input[1]].append(input[0])
}

func dfs(_ graph:[[Int]], _ v: Int) {
  visited[v] = true
  print(v, terminator:" ")

  for i in graph[v] {
    if !visited[i] {
      dfs(graph, i)
    }
  }
}

dfs(graph, 1)
print(visited.filter { $0 }.count-1)