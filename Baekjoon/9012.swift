struct Stack<T> {
  var elements:[T] = []
  var isEmpty: Bool {
    return elements.isEmpty
  }

  mutating func push(_ element: T) {
    elements.append(element)
  }

  mutating func pop() -> T? {
    if isEmpty {
      return nil
    }
    return elements.popLast()
  }
}

let N = Int(readLine()!)!
var input:[String] = []
var suspended = false

for _ in 0..<N {
  input = readLine()!.map{ String($0) }
  var stack = Stack<String>()
  suspended = false

  for i in input {
    
    if i == "(" {
      stack.push("(")
    }
    else {
      if stack.isEmpty {
        print("NO")
        suspended = true
        break
      }
      else{
        stack.pop()
      }
    }
  }

  if stack.isEmpty && !suspended {
    print("YES")
  }
  else if !stack.isEmpty && !suspended {
    print("NO")
  }
}