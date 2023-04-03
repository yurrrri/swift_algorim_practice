func dfs(_ graph:[[Int]], _ v: Int) {
  visited[v] = true
  print(v, terminator:" ")

  for i in graph[v] {
    if !visited[i] { //방문하지 않은 인접 노드에 대해 재귀
      dfs(graph, i)
    }
  }
}

func bfs(_ graph:[[Int]], _ v: Int) {
  var q = [v]
  visited[v] = true //시작노드 큐 삽입 및 방문처리

  while !q.isEmpty {
    let v = q.removeFirst() //뽑아서 출력
    print(v, terminator:" ")

    for i in graph[v] { //인접노드 중 방문하지 않은 노드들 모두 큐에 추가 및 방문처리
      if !visited[i] {
        q.append(i)
        visited[i] = true
      }
    }
  }
}

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0], M = input[1], V = input[2]
var graph:[[Int]] = Array(repeating: [], count: N+1)

for _ in 0..<M {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  graph[input[0]].append(input[1]) //양방향
  graph[input[1]].append(input[0])
}

graph = graph.map { $0.sorted() } //작은순서대로 처리하기 위해 sort

var visited = Array(repeating:false, count:N+1)

dfs(graph, V)
visited = Array(repeating:false, count:N+1) //초기화
print()
bfs(graph, V)