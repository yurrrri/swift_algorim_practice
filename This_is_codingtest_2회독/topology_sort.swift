import Foudation

// 노드와 개수와 간선(union 연산)의 개수 입력받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let v = input[0], e = input[1]

// 모든 노드에 대한 진입차수는 0으로 초기화
var indegree = [Int](repeating: 0, count: v + 1)

// 각 노드에 연결된 간선 정보를 담기 위한 연결 리스트(그래프) 초기화
var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: v + 1)

// 모든 간선에 대한 정보를 입력받기
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    graph[a].append(b)  // 정점 A에서 B로 이동 가능
    // 진입차수를 1 증가
    indegree[b] += 1
}

// 위상 정렬 함수
func topologySort() {
    var result: [Int] = []  // 알고리즘 수행 결과를 담을 리스트
    var q: [Int] = [] // 큐
    
    // 처음 시작할 때는 진입차수가 0인 노드를 큐에 삽입
    for i in 1...v {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    // 큐가 빌 떄까지 반복
    while !q.isEmpty {
        // 큐에서 원소 꺼내기
        let now = q.removeFirst()
        result.append(now)
        // 해당 원소와 연결된 노드들의 진입차수에서 1 빼기
        for i in graph[now] {
            indegree[i] -= 1
            // 새롭게 진입차수가 0이 되는 노드를 큐에 삽입
            if indegree[i] == 0 {
                q.append(i)
            }
        }
    }
    
    // 위상 정렬을 수행한 결과 출력
    for i in result {
        print(i, terminator: " ")
    }
}

topologySort()