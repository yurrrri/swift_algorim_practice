import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
  var input = readLine()!.map { String($0) }
  var half = input.count/2
  var flag = false
  
  if Array(input[..<half]) == Array(input[half...]) {
    print(0)
  } else {
    for i in 0..<input.count {
      let removed = input[i]
      input.remove(at: i)

      if input[..<(input.count/2)] == input[(input.count/2)...] {
        print(1)
        flag = true
        break
      }
      input.insert(removed, at: i)
    }

    if !flag { print(2) }
  }
}