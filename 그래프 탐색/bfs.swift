func bfs(_ graph:[[Int]], _ v:Int){
  queue = [v]
  //현재 노드를 방문 처리
  visited[v] = true

  while !queue.isEmpty {
    a = queue.removeFirst()
    print("\(a) ")

    for i in graph[a]{
      if !visited[i]{
        queue.append(i)
        visited[i] = true
      }
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
var queue:[Int] = []
var a = 0

bfs(graph, 1)