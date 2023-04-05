import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []

var nx = 0
var ny = 0

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var visited:[(Int, Int)] = []

for _ in 0..<n {
  board.append(readLine()!.map { Int(String($0))! })
}

func containsTuple(_ array:[(Int, Int)], _ tuple:(Int, Int)) -> Bool {
  let (x, y) = tuple
  for (a, b) in array {
    if a == x && b == y {
      return true
    }
  }
  return false
}

var num = 0
var house_count = 0

func dfs(_ x: Int, _ y: Int) {
  visited.append((x, y))
  num += 1 //방문 횟수 -> 구역마다의 집 개수

  for i in 0..<4 {
    nx = x + dx[i]
    ny = y + dy[i]

    if 0<=nx && nx<n && 0<=ny && ny<n && board[nx][ny] == 1 && !containsTuple(visited, (nx, ny)){
      dfs(nx, ny)
    }
  }
}

var temp:[Int] = []

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 1 && !containsTuple(visited, (i, j)){ //집 구역이지만 아직 돌지않은 부분에 대해 DFS 진행
      dfs(i, j)
      house_count += 1
      temp.append(num)
      num = 0
    }
  }
}

print(house_count)
print(temp.sorted().map { String($0) }.joined(separator:"\n"))