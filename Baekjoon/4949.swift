var input = ""
var flag = false

while true {
  flag = false
  input = readLine()!

  if input == "." {
    break
  }
  
  var stack:[String] = []
  let splited = input.filter { "([])".contains($0) }

  for i in splited {
    if i == "(" {
      stack.append("(")
    }
    else if i==")" {
      if (stack.isEmpty || stack.removeLast() != "(") && !flag {
        print("no")
        flag = true
      }
    }
    else if i=="[" {
       stack.append("[")
    }
    else if i=="]" {
      if (stack.isEmpty || stack.removeLast() != "[") && !flag {
        print("no")
        flag = true
      }
    }
  }

  if !flag {
    if stack.isEmpty {
      print("yes")
    }
    else {
      print("no")
    }
  }
}