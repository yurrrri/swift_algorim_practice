var input = readLine()!.map { String($0) }
var answer:[String] = []
var stack:[String] = []
var temp = ""
var i = 0

for i in 0..<input.count{
  if input[i] == "<" {
    while !stack.isEmpty {
      temp += stack.removeLast()
    }
    answer.append(temp)
    temp = "<"
  }
  else if input[i] == ">" {
    stack = stack.reversed()
    while !stack.isEmpty {
      temp += stack.removeLast()
    }
    answer.append(temp)
    answer.append(">")
    temp = ""
  }
  else{
    if input[i] == " " {
      if temp.contains("<"){
        stack.append(" ")
      }
      else{
        while !stack.isEmpty {
          temp += stack.removeLast()
        }
        answer.append(temp)
        answer.append(" ")
        temp = ""
      }
    }
    else{
      stack.append(input[i])
    }
  }
}

while !stack.isEmpty {
  temp += stack.removeLast()
}
answer.append(temp)

print(answer.joined())