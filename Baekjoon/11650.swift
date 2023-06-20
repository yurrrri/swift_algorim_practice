import Foundation

let n = Int(readLine()!)! //짝수 -> 절반으로 나눠야함
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}

board.sort(by: {
  if $0[0] == $1[0] {
    return $0[1] < $1[1]
  } else {
    return $0[0] < $1[0]
  }
})

for i in 0..<n {
  print("\(board[i][0]) \(board[i][1])")
}