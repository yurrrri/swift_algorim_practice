let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}

// 이동할 네 방향 정의 (상, 하, 좌, 우)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// BFS 소스코드 구현
func bfs(x: Int, y: Int) -> Int {
    // Queue
    var q: [(Int, Int)] = []
    q.append((x, y))
    
    // 큐가 빌 때까지 반복
    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        // 현재 위치에서 네 방향으로의 위치 확인
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if (nx>=0 && nx<n && ny>=0 && ny<m) && graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                q.append((nx, ny))
            }
        }
    }
    // 가장 오른쪽 아래까지의 최단 거리 반환
    return graph[n - 1][m - 1]
}
// BFS를 수행한 결과 출력
print(bfs(x: 0, y: 0))