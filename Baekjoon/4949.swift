var input = ""

while true {
  input = readLine()!

  if input == "." {
    break
  }
  var stack = []
  let splited = input.filter { "([])".contains($0) }

  for i in splited {
    if i == "(" {
      stack.append("(")
    }
    else if i==")" {
      if stack.isEmpty || stack.removeLast() != "(" {
        print("no")
        continue
      }
    }
    else if i=="[" {
       stack.append("[")
    }
    else if i=="]" {
      if stack.isEmpty || stack.removeLast() != "(" {
        print("yes")
        continue
      }
    }
  }

  if stack.isEmpty {
    print("yes")
  }
  else{
    print("no")
  }
}