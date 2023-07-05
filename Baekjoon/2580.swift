import Foundation

var board:[[Int]] = []
var zeroCoord:[(Int, Int)] = []

for _ in 0..<9 {
  board.append(readLine()!.map { Int($0)! })
}

for i in 0..<9 {
  for j in 0..<9 {
    if board[i][j] == 0 {
      zeroCoord.append((i, j))
    }
  }
}

func isValidRow(_ row: Int, _ num: Int) -> Bool { // 유효한 행인지 체크
  if board[row].contains(num) {
    return false
  }
  return true
}

func isValidCol(_ col: Int, _ num: Int) -> Bool {
  for i in 0..<9 {
    if board[i][col] == num {
      return false
    }
  }
  return true
}

func isValidSquare(_ row:Int, _ col: Int, _ num: Int) -> Bool {
    let nrow = row / 3 * 3
    let ncol = col / 3 * 3
    
    for i in 0..<3 {
        for j in 0..<3 {
            if board[nrow + i][ncol + j] == num {
                return false
            }
        }
    }
    return true
}

func backtracking(_ depth: Int) {
  if depth == zeroCoord.count {   // 이미 0을 다 올바르게 채웠으면
    for i in 0..<9 {
      for j in 0..<9 {
        print(board[i][j])
      }
      print()
    }

    exit(0)
  }

  let x = zeroCoord[depth].0
  let y = zeroCoord[depth].1
  
  for i in 1...9 {

    if isValidRow(x, i) && isValidCol(y, i) && isValidSquare(x, y, i) {
      board[x][y] = i
      backtracking(depth+1)
      board[x][y] = 0
    }
  }
}

backtracking(0)