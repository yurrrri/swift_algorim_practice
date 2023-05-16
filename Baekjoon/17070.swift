import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []

var answer = 0

enum Type {
  case hor //가로
  case ver //세로
  case diag //대각선
}

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}

func dfs(_ x: Int, _ y: Int, _ type: Type) {
  if (x, y) == (n-1, n-1){
    answer += 1
    return
  }

  switch type {
    case .hor:
    if y+1 < n {
      if board[x][y+1] != 1 {
        dfs(x, y+1, .hor)
      }
    if x+1 < n {
      if board[x][y+1] != 1 && board[x+1][y+1] != 1 && board[x+1][y] != 1 {
        dfs(x+1, y+1, .diag)
      }
      }
    }
    case .ver:
    if x+1 < n {
      if board[x+1][y] != 1 {
          dfs(x+1, y, .ver)
      }
      if y+1 < n {
        if board[x][y+1] != 1 && board[x+1][y+1] != 1 && board[x+1][y] != 1 { //빈칸이어야한다고 색으로 표시된 영역
            dfs(x+1, y+1, .diag)
        }
      }
    }
    case .diag:
    if y+1 < n {
      if board[x][y+1] != 1 {
          dfs(x, y+1, .hor)
      }
      if x+1 < n {
        if board[x][y+1] != 1 && board[x+1][y+1] != 1 && board[x+1][y] != 1 {
          dfs(x+1, y+1, .diag)
        }
      }
    }
    if x+1 < n {
      if board[x+1][y] != 1 {
        dfs(x+1, y, .ver)
      }
    }
  }
}

dfs(0, 1, .hor)
print(answer)