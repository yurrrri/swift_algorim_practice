let N = Int(readLine()!)!
let array = readLine()!.split(separator:" ").map { String($0) }
let move_types = ["L", "R", "U", "D"] //움직이는 타입
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var x = 1
var y = 1
var nx = 1
var ny = 1

for i in array {
  for j in 0...move_types.count-1 {
    if i == move_types[j] {
      nx = x+dx[j]
      ny = y+dy[j]

      if nx < 1 || nx > N || ny < 1 || ny > N {
        continue
      }

      x = nx
      y = ny
    }
  }
}

print("\(x) \(y)")