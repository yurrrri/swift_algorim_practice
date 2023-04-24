import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []
var copy:[[Int]] = []

var visited = Array(repeating: Array(repeating: 0, count:n), count:n)

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

var answer = Int.max

for _ in 0..<n {
  board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func dfs(_ v:(Int, Int)) -> Int {
  let (x, y) = v
  
  var cost = board[x][y]
  var count = 1
  
  for i in 0..<4 {
    nx = x + dx[i]
    ny = y + dy[i]

    guard 0..<n ~= nx && 0..<n ~= ny && copy[nx][ny] == 0 else { continue }

    copy[nx][ny] = 2
    count += 1
    cost += board[nx][ny]

    if count == 5 {
      return cost
    }
  }
  return 10000 //꽃을 하나라도 심을 수 없는 경우 (겹치거나 범위 벗어남) 최소값을 비교할 수 없으므로 많이 큰 값을 return하게해서 backtracking에서 최소값 후보에 넣지 않게됨
}

func backtracking(_ depth:Int){
  if depth == 3 {
    copy = visited
    var sum = 0
    
    for i in 0..<n {
      for j in 0..<n {
        if copy[i][j] == 1 {
          sum += dfs((i, j))
        }
      }
    }

    answer = min(answer, sum)

    return
  }

  for i in 0..<n {
    for j in 0..<n {
      if visited[i][j] == 0 {
        visited[i][j] = 1
        backtracking(depth+1)
        visited[i][j] = 0
      }
    }
  }
}

backtracking(0)
print(answer)