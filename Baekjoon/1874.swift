import Foundation

let n = Int(readLine()!)!

var answer:[String] = []
var stack:[Int] = []
var num = 1

for _ in 0..<n {
  let input = Int(readLine()!)!

  while num <= input { //스택 넣기 (num이 input보다 작거나 같을때에만 실행)
    stack.append(num)
    answer.append("+")
    num += 1
  }

  if stack.last == input {
    stack.popLast()
    answer.append("-")
  } else {
    print("NO")
    exit(0)
  }
}

print(answer.joined(separator:"\n"))