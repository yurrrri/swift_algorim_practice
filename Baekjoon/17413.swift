var input = readLine()!.map { String($0) }
var answer:[String] = []
var stack:[String] = []
var temp = ""
var i = 0

//ver1
for i in 0..<input.count{
  if input[i] == "<" {
    while !stack.isEmpty {
      temp += stack.removeLast() //그 전까지의 애들 거꾸로 출력
    }
    answer.append(temp)
    temp = "<"
  }
  else if input[i] == ">" {
    stack = stack.reversed() //안에 있었던 모든 내용 그대로 추가함
    while !stack.isEmpty {
      temp += stack.removeLast()
    }
    answer.append(temp)
    answer.append(">")
    temp = ""
  }
  else{
    if input[i] == " " { //공백일 때
      if temp.contains("<"){ //<안에 있는 공백이라면 ""만 추가하고 >를 만날 때 출력하도록
        stack.append(" ")
      }
      else{ //괄호 안에 있었던 것이 아니면 거꾸로 temp에 더한다음에
        while !stack.isEmpty {
          temp += stack.removeLast()
        }
        answer.append(temp)
        answer.append(" ") //공백 추가하고
        temp = "" //temp는 초기화
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

//ver2
import Foundation

let input = readLine()!.map { String($0) }
var answer = ""
var temp = ""

for i in input {
  if i == " " {
    if temp.first! == "<" { //꺾쇄면 그대로 temp에 더하고
      temp += " "
    } else { //아니면 먼저 뒤집어서 더하고 temp 초기화
      answer += String(temp.reversed())
      answer += " "
      temp = ""
    }
  } else if i == "<" {
    answer += String(temp.reversed())
    temp = "<"
  } else if i == ">" { //temp 그대로 더하고 초기화
    answer += temp
    answer += ">"
    temp = ""
  } else {
    temp += i
  }
}

answer += temp.reversed()
print(answer)