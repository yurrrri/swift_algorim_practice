import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []

var dx = [0, 1, 1] //차례대로 가로, 대각선, 세로
var dy = [1, 1, 0]

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}

func dfs() {
  
}