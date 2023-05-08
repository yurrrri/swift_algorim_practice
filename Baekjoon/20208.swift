import Foundation

let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmh[0], m = nmh[1], h = nmh[2] //마을 크기, 초기 체력, 증가하는 h양
var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count:n), count:n)

var milks = [(Int, Int)]()
var house = (0, 0)

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 1 {
      house = (i, j)
    } else if board[i][j] == 2 {
      milks.append((i, j))
    }
  }
}

if milks.isEmpty {
  print(0)
  exit(0)
}

func permutation(_ left:Int, _ right: Int){
  if left == right {
    simulation()
    return
  }

  for i in left...right {
    milks.swapAt(i, left)
    permutation(left+1, right)
    milks.swapAt(i, left)
  }
}

var answer = 0
//num: 초코우유 개수
func simulation() {
  var hp = m
  var count = 0

  var nx = house.0
  var ny = house.1

  for (i, j) in milks {
    let dist = abs(nx-i) + abs(ny-j)
    if hp - dist < 0 { return } //체력에서 민트초코간의 거리(민트초코로 이동하기 까지의 소모 체력)을 뺐을 때 떨어지면 찾는 경우의 수가 아니므로 백트랙

    hp -= dist //잔여 체력
    hp += h //민트초코 먹었으므로 +h
    count += 1 //민트초코 개수 + 1

    if hp >= abs(house.0-i) + abs(house.1-j) { //현재 체력으로 집으로 갈 수 있다면
      answer = max(answer, count)
    }

    nx = i //그 다음 우유로 이동
    ny = j
  }
}

permutation(0, milks.count-1)
print(answer)