import Foundation

let n = Int(readLine()!)!
var like_list:[Int:[Int]] = [:]
var board = Array(repeating: Array(repeating:0, count:n+1), count:n+1)
var number:[Int] = []
var status:[(Int, Int, Int, Int)] = []
let dx = [-1, 1, 0, 0] // |r1-r2| + |c1-c2| = 1이라는건 상하좌우를 의미함
let dy = [0, 0, -1, 1]
var nx = 0, ny = 0

for _ in 0..<(n*n) {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  number.append(input[0])
  like_list[input[0]] = Array(input[1...])
}

for i in 0..<n*n {
  let current = number[i]
  status = []
  for x in 1...n {
    for y in 1...n {
      if board[x][y] == 0 {
        var like = 0, empty = 0
        for j in 0..<4 {
          nx = x + dx[j]
          ny = y + dy[j]

          guard 1...n ~= nx && 1...n ~= ny else { continue }
          
          if like_list[current]!.contains(board[nx][ny]) {
            like += 1
          } 
          if board[nx][ny] == 0 {
            empty += 1
          }
        }
        status.append((like, empty, x, y)) // 비어있는 칸에서 좋아하는 학생이 가장 많은 칸, 비어있는 칸, 현재 좌표 순서대로
      }
    }
  }
  
  status.sort(by: {   // 비어있는 칸의 조건들 중 어떤 자리에 앉힐지를 정함
    if $0.0 != $1.0 { // 좋아하는 학생이 가장 많은 칸으로 정렬
      return $0.0 > $1.0
    } else if $0.1 != $1.1 { // 비어있는 칸이 많은 순으로 앞으로
      return $0.1 > $1.1
    } else if $0.2 != $1.2 { // 행, 열 차례대로 작은 수
      return $0.2 < $1.2
    } else {
      return $0.3 < $1.3
    }
  })
  board[status[0].2][status[0].3] = current
}

var sum = 0 
for i in 1...n {
  for j in 1...n {
    var manjok = 0
    let current = board[i][j]
    
    for k in 0..<4 {
      nx = i + dx[k]
      ny = j + dy[k]

      guard 1...n ~= nx && 1...n ~= ny else { continue }

      if like_list[current]!.contains(board[nx][ny]) {
        manjok += 1
      }
    }

    switch manjok {
      case 1:
      sum += 1
      case 2:
      sum += 10
      case 3:
      sum += 100
      case 4:
      sum += 1000
      default: break
    }
  }
}

print(sum)