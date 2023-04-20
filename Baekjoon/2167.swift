import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0]
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

let k = Int(readLine()!)!
for _ in 0..<k {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let i = input[0], j = input[1], x = input[2], y = input[3]
  var sum = 0

  for a in i-1...x-1 {
    for b in j-1...y-1 {
      sum += board[a][b]
    }
  }
  print(sum)
}