let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0]
let M = input[1]

let input2 = readLine()!.split(separator:" ").map { Int(String($0))! }
var pos_x = input2[0] //처음 캐릭터가 서있는 좌표
var pos_y = input2[1]
var direction = input2[2] // 방향

var dx = [-1, 0, 1, 0]
var dy = [0, 1, 0, -1]

var nx = pos_x
var ny = pos_y

var board:[[Int]] = []
var answer = 1
var count = 0

for _ in 0..<N {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}
board[pos_x][pos_y] = 1

while true {
  //1. 회전
  direction = direction == 0 ? 3 : direction-1
  nx = pos_x + dx[direction]
  ny = pos_y + dy[direction]

  //2. 가보지 않은 칸이 존재한다면 전진하고, 없다면 아무일도 안함
  if board[nx][ny] != 1 {
    board[nx][ny] = 1
    pos_x = nx //전진
    pos_y = ny
    count = 0 // 갈 수 없을때마다 세야하므로, 갈 수 있다면 값 초기화
    answer += 1
  }
  else{
    count += 1
  }

  if count == 4 {
    nx = pos_x - dx[direction]
    ny = pos_y - dy[direction]

    if board[nx][ny] == 0 {
      pos_x = nx //뒤로 전진
      pos_y = ny
      answer += 1
      count = 0
    }
    else{
      break
    }
  }
}

print(answer)