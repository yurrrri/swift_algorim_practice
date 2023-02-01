let input = readLine()!.split(separator:" ").map { Int($0)! }
let N = input[0] //세로
let M = input[1] //가로
let pos = Array(input[2...3]) //주사위 좌표 

let dx = [0, 0, 0, -1, 1] //차례대로 동서북남 (1, 2, 3, 4 이기때문에 맨 첫번째에 임의의 수 하나 넣어줌)
let dy = [0, 1, -1, 0, 0]

var board:[[Int]] = []
var dice = Array(repeating:Array(repeating:0, count:3), count:4)

var x = pos[0]
var y = pos[1]

var nx = 0
var ny = 0

for _ in 0..<N {
  board.append(readLine()!.split(separator:" ").map{Int($0)! })
}

let position_list = readLine()!.split(separator:" ").map{ Int($0)! }

func roll(_ direction:Int){
  var tmp = 0

  //바닥부분도 항상 따져줘야함. 동/서로 이동해도 바닥부분은 바뀜
  if direction == 1 { //동
    // 012 -> 201 -> 120 -> 012
        tmp = dice[3][1]//bottom
        dice[3][1] = dice[1][2]
        dice[1][2] = dice[1][1]
        dice[1][1] = dice[1][0]
        dice[1][0] = tmp
  }
  else if direction == 2 { //서
    //012 -> 120 -> 201 -> 012
        tmp = dice[3][1] //바닥
        dice[3][1] = dice[1][0]
        dice[1][0] = dice[1][1]
        dice[1][1] = dice[1][2]
        dice[1][2] = tmp

  } else if direction == 3 { //북
        tmp = dice[3][1] //바닥
        dice[3][1] = dice[0][1]
        dice[0][1] = dice[1][1]
        dice[1][1] = dice[2][1]
        dice[2][1] = tmp
  }
  else { //남
        tmp = dice[3][1] //바닥
        dice[3][1] = dice[2][1]
        dice[2][1] = dice[1][1]
        dice[1][1] = dice[0][1]
        dice[0][1] = tmp
  }
}

for i in position_list {
  nx = x + dx[i]
  ny = y + dy[i]

  if 0<=nx && nx<N && 0<=ny && ny<M {
    roll(i)

    if board[nx][ny] == 0 {
      board[nx][ny] = dice[3][1]
    }
    else {
      dice[3][1] = board[nx][ny]
      board[nx][ny] = 0
    }

    print(dice[1][1])

    x = nx
    y = ny
  }
  else{
    continue
  }
}