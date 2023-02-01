import Foundation

let N = Int(readLine()!)! //보드
var board:[[Int]] = []
for _ in 0..<N+1{
  board.append(Array(repeating: 0, count:N+1))
}

let apple = Int(readLine()!)! //사과 갯수
var xy:[Int] = []
for _ in 0..<apple { //사과 놓기
  xy = readLine()!.components(separatedBy:" ").map { Int($0)! }
  board[xy[0]][xy[1]] = 1
}

let L = Int(readLine()!)! //방향 변환
var direction_info:[[String]] = [] //방향 전환 정보
for _ in 0..<L {
  direction_info.append(readLine()!.components(separatedBy:" "))
}

var x = 1
var y = 1
board[1][1] = 2 //맨 첫번째에서 방문처리

var direction = 0 //처음에는 동쪽
var dx = [0, 1, 0, -1]
var dy = [1, 0, -1, 0]

func rotate(i:Int, direct: String) -> Int {
  if direct == "L" {
    return (i-1) % 4
  }
  else{
    return (i+1) % 4
  }
}

var i = 0 //direction_info 인덱스
var count = 0 //초
var tail:[[Int]] = [[x, y]]
var tail_poped:[Int] = []

var nx = x
var ny = y

while true {
  //이동
  nx = x+dx[direction]
  ny = y+dy[direction]
  if (nx <= N && nx >= 1) && (ny <= N && ny >= 1) && board[nx][ny] != 2 {
    
    if board[nx][ny] == 1 { //사과 있으면
      board[nx][ny] = 2 //둘다 방문처리
      tail.append([nx, ny])
    }
    else if board[nx][ny] == 0 { //사과 없으면
      board[nx][ny] = 2
      tail.append([nx, ny])
      tail_poped = tail.removeFirst()
      board[tail_poped[0]][tail_poped[1]] = 0 // 비움처리
    }
  }
  else{ //벽에 부딪힘 혹은 자기 자신한테 부딪힘
    count += 1 //더하고 끝남
    break
  }
  x = nx //이동
  y = ny
  count += 1

  if i<L {
    if count == Int(direction_info[i][0]){
      direction = rotate(i: direction, direct: direction_info[i][1])
      i+=1
    }
  }
}

print(count)