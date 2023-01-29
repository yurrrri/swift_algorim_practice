import Foundation

let N = Int(readLine()!)! //보드
var board:[[Int]] = []
for _ in 0..<N+1{
  board.append(Array(repeating: 0, count:N+1))
}

let apple = Int(readLine()!)! //사과
var xy:[Int] = []
for _ in 0..<apple { //사과 놓기
  xy = readLine()!.components(separatedBy:" ").map { Int($0)!-1 } //인덱스라서 1 뺌
  board[xy[0]][xy[1]] = 1
}

let L = Int(readLine()!)! //방향 변환
var direction:[[String]] = [] //방향 전환 정보
for _ in 0..<L {
                direction.append(readLine()!.components(separatedBy:" "))
}

var x = 1
var y = 1
board[1][1] = 2 //맨 첫번째에서 방문처리

var index = 0 //처음에는 동쪽
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

var i = 0 //이동 횟수를 세기 위한 변수
var count = 0 //초
var q = [[x, y]] //뱀이 차지하고 있는 위치 정보 (꼬리가 앞쪽)
var poped:[Int] = []

var nx = x
var ny = y

while true {
  //이동
  nx = x+dx[index]
  ny = y+dy[index]
  if (nx <= N && nx >= 1) && (ny <= N && ny >= 1) && board[nx][ny] != 2 {
    
    if board[nx][ny] == 1 { //사과 있으면
      board[nx][ny] = 2 //방문처리
      q.append([nx, ny])
    }
    else if board[x][ny] == 0 { //사과 없으면
      board[nx][ny] = 2
      q.append([nx, ny])
      poped = q.removeFirst()

      board[poped[0]][poped[1]] = 0
    }
  }
  else{ //벽에 부딪힘 혹은 자기 자신한테 부딪힘
    count += 1
    break
  }
  x = nx
  y = ny
  count += 1

  if count == Int(direction[i][0])! && i<L {
    index = rotate(i: index, direct: direction[i][1])
    i+=1
  }
}

print(count)