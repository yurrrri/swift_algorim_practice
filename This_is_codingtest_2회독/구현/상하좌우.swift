
let N = Int(readLine()!)!
let input = readLine()!.split(separator:" ").map { String($0) }

let pos = [-1, 1]

var nx = 1
var ny = 1
var index = 0

for i in input {
  switch i {
    case "L":
      index = 0
      if ny+pos[0] >= 1 {
        ny = ny+pos[0]
      }
    case "R":
      if ny+pos[1] <= N {
        ny = ny+pos[1]
      }
    case "U":
      if nx+pos[0] >= 1{
        nx = nx+pos[0]
      }
    case "D":
      if nx+pos[1] <= N {
        nx = nx + pos[1]
      }
    default:
    break
  }
}

print("\(nx) \(ny)")