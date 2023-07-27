import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let m = input[0], n = input[1]   //m: x / n : y
var board:[[Int]] = []
for _ in 0..<m {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}
var dp = Array(repeating: Array(repeating: -1, count: n), count:m)
//오답노트 1.
//dp와 board혹은 visited와 board를 활용하여 같이 탐색하는 형태일 때, index error를 방지하기 위해 2개의 수의 행 x 열을 반드시 동일하게 맞춰줄것

//오답노트 2.
// 초기값을 0이 아니라 -1로 지정하는 이유?
// dp는 메모이제이션을 위해서 존재하는데, 경로의 수가 0인 경우도 존재하므로, 27번째 줄에서 0이 아닌것으로 조건을 주면 중복적으로 탐색하는 것과 같게됨

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var ny = 0, nx = 0

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == m-1 && y == n-1 {
        return 1
    }
    
    if dp[x][y] != -1 {  // 탐색 중복 제거 (경로는 0일수도 있음)
        return dp[x][y]  // 경로의
    }

    dp[x][y] = 0
  // 오답노트 3. 0으로 초기화하는 이유? -> 방문 여부 체크 (나중에 중복적으로 탐색하지 않게 하기 위함)
  
    for i in 0..<4 { // 상하좌우로 탐색
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<m ~= nx && 0..<n ~= ny else { continue }

      if board[x][y] > board[nx][ny] {
        dp[x][y] += dfs(nx, ny)
      }
    }
    
    return dp[x][y]
}

print(dfs(0, 0))
print(dp)