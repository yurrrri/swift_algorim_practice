import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], l = input[1], r = input[2]

var board:[[Int]] = []

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]
var nx = 0
var ny = 0

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}
var visited = Array(repeating: Array(repeating: false, count: n), count: n) //중복으로 연합으로 묶지 않기 위한 visited 배열

func bfs(_ i:Int, _ j:Int) -> Int {
  var q = [(i, j)]
  var union = [(i, j)] //연합된 나라 리스트

  var sum = board[i][j] // 연합된 나라의 인구수 총합
  visited[i][j] = true //맨 처음 시작점은 방문처리
  
  while !q.isEmpty {
    let (x, y) = q.removeFirst()

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      if 0..<n ~= nx && 0..<n ~= ny && l...r ~= abs(board[nx][ny] - board[x][y]) && !visited[nx][ny] {
        visited[nx][ny] = true
        sum += board[nx][ny]
        union.append((nx, ny))
        q.append((nx, ny))
      }
    }
  }

  let unionPeopleCount = Int(floor(Double(sum) / Double(union.count))) //연합된 나라는 모두 (총합 / 연합 수)이며 소수점은 버림
  for (i, j) in union {
    board[i][j] = unionPeopleCount
  }
  
  return union.count
}

var answer = 0 // 며칠동안 인구이동이 발생했는가

while true {
  visited = Array(repeating: Array(repeating: false, count: n), count: n) //다시 연합으로 묶는 루프를 실행해야하므로 visited 초기화해야함
  var flag = false //인구 이동이 발생했는지에 대한 플래그 변수
  for i in 0..<n {
    for j in 0..<n {
      if !visited[i][j] {
        if bfs(i, j) > 1 {
          flag = true
        }
      }
    }
  }

  if !flag { break }
  answer += 1
}

print(answer)