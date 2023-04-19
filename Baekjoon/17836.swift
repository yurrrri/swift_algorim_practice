let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1], t = input[2] //제한시간
var board:[[Int]] = []
var visited = Array(repeating: Array(repeating: 0, count:m), count: n)

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var nx = 0
var ny = 0
var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]
var usedGramTime = Int.max

func bfs() -> Int {
  visited[0][0] = 0
  var q = [(0, 0)]

  while !q.isEmpty {
    let (x, y) = q.removeFirst()

    if x == n-1 && y == m-1 {
      return min(visited[x][y], usedGramTime) //도달했다면 그램을 거친것과 안거친것중 최소값 구하기 (그램을 안거쳤어도 평소 루트대로 탐색하는 값이 반환될 것임)
    }

    if board[x][y] == 2 {
      usedGramTime = n-1-x + m-1-y + visited[x][y] //visited[x][y] : 그램까지 오기까지의 거리
      print(usedGramTime)
    }
    
    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      guard 0..<n ~= nx && 0..<m ~= ny else { continue } 

      if visited[nx][ny] == 0 && board[nx][ny] != 1 {
        visited[nx][ny] = visited[x][y] + 1
        print(visited[nx][ny])
        q.append((nx, ny))
      }
    }
  }

  return Int.max //도달할 수 없다면 max값 반환
}

let result = bfs()

if result > t { //공주한테 도달하지 못하거나 최소값이더라도 t를 넘어갈 경우
  print("Fail")
} else {
  print(result)
}