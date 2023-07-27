import Foundation

//해결 안됨 -> 이해안되서 안품
let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]
var board:[[String]] = []

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var minValue = Int(1e9) // 지민이가 칠해야하는 최소 정사각형의 개수 (나중에 반환할 정답)

for a in 0..<n-7 {   // 보드 탐색의 처음 시작 위치 지정 (n-7을 하는 이유는, 이 지점을 시작으로 아래에서 8뒤까지 탐색하면서 화이트보드를 어떻게 칠할것인지 정해야하기 때문이다)
  for b in 0..<m-7 {
    var w_index = 0
    var b_index = 0

    for i in a..<a+8 { // 각 출발지점 별로 길이가 8인 화이트보드 탐색 (마치 네모 하나 만들어서 옆으로 밀면서 보듯이)
      for j in b..<b+8 {
        if (i+j) % 2 == 0{ // 인덱스의 합이 짝수인 경우 -> B 혹은 W로 칠함
          if board[i][j] != "W" { // B -> W
            w_index += 1
          }
          else {
            b_index += 1    // W -> B
          }
        }
        else {   // 인덱스의 합이 홀수인 경우 -> 
          if board[i][j] != "W" {
            b_index += 1
          }
          else {
            w_index += 1
          }
        }
      }
    }
    minValue = min(minValue, b_index, w_index)
  }
}

print(minValue)