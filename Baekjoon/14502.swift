//이후에 조합으로도 풀면 좋을듯. 시간이 꽤 많이 걸림 (백트래킹)
import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1] //n: 세로 m: 가로

var board:[[Int]] = []
var copied:[[Int]] = []

var answer = 0

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

func dfs(_ v: (Int, Int)) {
  let (x, y) = v
  copied[x][y] = 2
  
  for i in 0..<4 {
    nx = x + dx[i]
    ny = y + dy[i]
    
    guard 0..<n ~= nx && 0..<m ~= ny else { continue } //return문으로 안쓰게 조심!!!!
    
    if copied[nx][ny] == 0 {
      dfs((nx, ny))
    }
  }
}

func countSafeArea(_ board:[[Int]]) -> Int {
  var count = 0
  
  for i in 0..<n {
    for j in 0..<m {
      if board[i][j] == 0 {
        count += 1
      }
    }
  }
  return count
}

var temp:[(Int, Int)] = []

func backtracking(_ depth: Int) {
  if depth == 3 {
    temp = []
    
    copied = board
    for i in 0..<n {
      for j in 0..<m {
        if copied[i][j] == 2 {
          temp.append((i, j))
        }
      }
    }

    for (x, y) in temp {
      dfs((x, y))
    }
    
    answer = max(answer, countSafeArea(copied))
    
    return
  }
  
  for i in 0..<n {
    for j in 0..<m {
      if board[i][j] == 0 {
        board[i][j] = 1
        backtracking(depth+1)
        board[i][j] = 0
      }
    }
  }
}

backtracking(0)
print(answer)