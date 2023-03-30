let input = readLine()!.map { String($0) }
var stack:[String] = []
var answer = 0

if input.count % 5 != 0 || input.first! != "q" {
  print(-1)
} else {
  for i in input {
    if i=="k" {
      i
    } else {
      stack.append(i)
    }
  }
}