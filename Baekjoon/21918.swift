let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0]
let M = input[1]
var bulbs = [0] + readLine()!.split(separator:" ").map { Int(String($0))! }

for _ in 0..<M {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  switch input.first! {
    case 1:
    bulbs[input[1]] = input[2]
    case 2:
    for i in input[1]...input[2] {
      bulbs[i] = 1-bulbs[i]
    }
    case 3:
    for i in input[1]...input[2] {
      bulbs[i] = 0
    }
    case 4:
    for i in input[1]...input[2] {
      bulbs[i] = 1
    }
    default:
    break
  }
}

bulbs.removeFirst()
print(bulbs.map { String($0)}.joined(separator:" "))