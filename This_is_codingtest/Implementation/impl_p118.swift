import Foundation

let move_xy = [[-1, 0], [0, 1], [-1, 0], [1, 0]] //차례대로 북, 동, 남, 서
let map_size = readLine()!.components(separatedBy:" ").map { Int($0)! } // N M
let N = map_size[0]
let M = map_size[1]
let character = readLine()!.components(separatedBy:" ").map { Int($0)! } //현재 좌표, 방향 
var array:[[Int]] = [] //맵
var d:[[Int]] = [] //캐릭터 방문 좌표
var direction = character[2] // 맨 처음 방향
var x = character[0] //맨 처음 x 좌표
var y = character[1] //맨 처음 y 좌표
var nx = 0 //이동할 x, y 좌표
var ny = 0
var count = 1 // 맨 처음 좌표를 방문처리 하므로 1에서부터 시작
var turning = 0

for _ in 0..<N {
  array.append(readLine()!.components(separatedBy:" ").map { Int($0)! })
}

for _ in 0..<N {
  d.append(Array(repeating:0, count:M))
}
d[x][y] = 1

func turn_left(){
  direction -= 1
  if direction == -1 {
    direction = 3
  }
}

while true {
  turn_left()
  nx = x + move_xy[direction][0]
  ny = y + move_xy[direction][1]

  if array[nx][ny] == 0 && d[nx][ny] == 0 {
    count += 1
    x = nx
    y = ny
    turning = 0
    d[x][y] = 1
    continue
  }
  else{
    turning += 1
  }

  if turning == 4 {
    nx = x - move_xy[direction][0]
    ny = y - move_xy[direction][1]

    if array[nx][ny] == 0 && d[nx][ny] == 0 {
      x = nx
      y = ny
      turning = 0
    }
    else{
      break
    }
  }
}

print(count)