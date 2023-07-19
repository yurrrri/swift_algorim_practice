import Foundation

let dx = [-1, 0, 1, 0]  // 북동남서
let dy = [0, 1, 0, -1]

var board:[[Int]] = []

var input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1] // 세로(x), 가로(y)
input = readLine()!.split(separator:" ").map { Int($0)! }
//(처음 로봇이 바라보는 방향) d: 0: 북 / 1: 동 / 2 : 남 / 3 : 서
var nx = input[0], ny = input[1], d = input[2]

for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int($0)! })
}

//2를 청소한 칸이라고 하고 탐색하기
var answer = 0
var tx = 0, ty = 0

while true {
  // 1. 아직 청소 안돼있으면
  if board[nx][ny] == 0 {
    answer += 1
    board[nx][ny] = 2   // 청소
  }

  var clean_empty_count = 0

  for i in 0..<4 { // 현재 칸의 주변 4칸 중에
    tx = nx + dx[i]
    ty = ny + dy[i]

    guard 0..<n ~= tx && 0..<m ~= ty else { continue }

    //처소되지 않은 빈칸 카운트
    if board[tx][ty] == 0 { clean_empty_count += 1 }  
  }

  if clean_empty_count == 0 {  // 청소안된 빈칸이 없다면
    tx = nx-dx[d]
    ty = ny-dy[d]

    if 0..<n ~= tx && 0..<m ~= ty && board[tx][ty] != 1 {  // 후진할 수 있다면 
      nx = tx  // 후진
      ny = ty
    }
    else {
      break
    }
  } else { // 청소되지 않은 빈칸이 있는 경우
    if d == 0 { d = 3 } // 반시계 방향으로 회전
    else { d -= 1 }

    tx = nx+dx[d]
    ty = ny+dy[d]

    if 0..<n ~= tx && 0..<m ~= ty && board[tx][ty] == 0 {   // 청소되지 않은 빈칸이면 한칸 전진
      nx = tx   
      ny = ty
    }
  }
  
}

print(answer)