import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], k = input[1]
var arr:[Set<String>] = []

for _ in 0..<n {
  arr.append(Set(readLine()!.map { String($0) }))
}

print(arr)