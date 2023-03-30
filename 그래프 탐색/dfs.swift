func dfs(_ graph:[[Int]], _ v:Int){
  //현재 노드를 방문 처리
  visited[v] = true
  print("\(v) ")

  for i in graph[v] {
    if !visited[i] {
      dfs(graph, i)
    }
  }
}

let graph = [
  [0],
  [2, 3, 8],
  [1, 7],
  [1, 4, 5],
  [3, 5],
  [3, 4],
  [7],
  [2, 6, 8],
  [1, 7]
]

var visited = Array(repeating:false, count:9)

dfs(graph, 1)