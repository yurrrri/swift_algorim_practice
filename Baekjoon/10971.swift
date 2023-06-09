import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []
var answer = Int(1e9)
var visited = Array(repeating: false, count: n)
// "한번 갔떤 도시로는 다시 갈 수 없다. -> 방문여부 표시"

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

// 백트래킹
// N개의 도시는 무조건 거쳐서 다시 원래의 도시로 돌아옴
func dfs(_ sum: Int, _ depth: Int, _ cur: Int, _ start: Int){
  if cur == start && depth == n { //n개의 도시를 거치고, start와 cur가 일치 -> 다시 원래의 도시로 돌아옴
    answer = min(answer, sum)
    return
  }

  for i in 0..<n { //visited[i]: 안간 도시만 가기
    if !visited[i] && board[cur][i] != 0 { // board[cur][i] : cur에서 i로 갈 때의 비용
      visited[i] = true // cur를 i로 -> i 도시 탐색
      dfs(sum+board[cur][i], depth+1, i, start)
      visited[i] = false
    }
  }
}

dfs(0, 0, 0, 0)
print(answer)