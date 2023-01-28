var first_position = readLine()!.map { String($0) }
var count = 0
var x = 0
var y = 0

switch first_position.first! {
  case "a":
  first_position[0] = 1
  break
  case "b":
  first_position[0] = 2
  break
  case "c":
  first_position[0] = 3
  break
  case "d":
  first_position[0] = 4
  break
  case "e":
  first_position[0] = 5
  break
  case "f":
  first_position[0] = 6
  break
  default:
  first_position[0] = 7
}
first_position = first_position.map { Int($0)! }

let direction = [[-2, -1], [-2, 1], [2, -1], [2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
for i in direction {
  x = first_position[0] + i[0]
  y = first_position[1] + i[1]
  if x < 1 || x > 8 || y < 1 || y > 8 {
    continue
  }
  else{
    count += 1
  }
}

print(count)