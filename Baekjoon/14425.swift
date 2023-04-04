import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]
var answer = 0

var set1:Set<String> = []

for _ in 0..<n {
  set1.insert(readLine()!)
}

for _ in 0..<m {
  if set1.contains(readLine()!){
    answer += 1
  }
}

print(answer)