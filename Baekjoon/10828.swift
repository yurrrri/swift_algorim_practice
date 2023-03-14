struct Stack<T> {
  var elements:[T] = []
  var top = -1

  var isEmpty: Bool {
    return elements.isEmpty
  }

  var count: Int {
    return elements.count
  }

  mutating func push(_ element: T){
    elements.append(element)
    self.top += 1
  }

  mutating func pop() -> T? {
    if isEmpty {
      return nil
    }
    self.top -= 1
    return elements.popLast()
  }

  func peek() -> T? {
    if isEmpty {
      return nil
    }
    return elements.last
  }
}

let N = Int(readLine()!)!
var temp:[String] = []
var stack = Stack<Int>()

for _ in 0..<N {
  temp = readLine()!.split(separator:" ").map { String($0) }

  switch temp[0] {
    case "push":
    stack.push(Int(temp[1])!)
    case "pop":
    let poped = stack.pop()
    if poped != nil {
      print(poped!)
    }
    else{
      print(-1)
    }
    case "top":
    if stack.peek() != nil {
      print(stack.peek()!)
    }
    else{
      print(-1)
    }
    case "size":
    print(stack.count)
    default:
    print(stack.isEmpty ? 1:0)
  }
}