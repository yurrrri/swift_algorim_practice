func bfs(_ graph:[[Int]], _ v:Int){
  //1. 시작노드를 큐에 넣고 방문처리
  var q = [v]
  visited[v] = true

  while !q.isEmpty {
    let v = q.removeFirst() //2. 선입선출 (가까운 노드부터 방문하므로)
    print(v, terminator:" ") //방문한 노드 출력

    for i in graph[v]{
      if !visited[i]{ //3. 인접한 노드 중 방문하지 않은 노드들 모두 큐에 넣고 방문처리
        q.append(i)
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
//입력받기 위한 2차월 빈 문자열
//var graph:[[Int]] = Array(repeating:[], count:N+1)

var visited = Array(repeating:false, count:9)

bfs(graph, 1)