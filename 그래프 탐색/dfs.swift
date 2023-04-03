 func dfs(_ graph:[[Int]], _ v:Int){
  //1. 현재 노드를 방문 처리 후 출력
  visited[v] = true
  print(v, terminator:" ")

  for i in graph[v] { //2. 인접 노드 중 방문하지 않은 노드들에 대해 탐색
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
//입력받기 위한 2차월 빈 문자열
//var graph:[[Int]] = Array(repeating:[], count:N+1)

var visited = Array(repeating:false, count:9)

dfs(graph, 1)