let N = Int(readLine()!)!
var answer = 0
var stack:[String] = []

for _ in 0..<N{
  var input = readLine()!.map { String($0) }

  if input.count%2 != 0 { //홀수면 짝이 안맞으므로 continue
    continue
  }
  else {
    stack = []
    for i in input {
      if let last = stack.last, i == last {
        stack.removeLast()
      }
      else{
        stack.append(i)
      }
    }
  }

  if stack.isEmpty {
    answer += 1
  }
}

print(answer)