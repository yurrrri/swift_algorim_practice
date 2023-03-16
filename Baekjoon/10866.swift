struct Dequeue<T> {
  var input = [T]()
  var output = [T]()
  
  var isEmpty : Bool {
      return input.isEmpty && output.isEmpty
  }
  var size: Int {
      return input.count + output.count
  }

  var first: T? {
    if isEmpty {
      return nil
    }
    return output.isEmpty ? input.first! : output.last!
  }
  
  var last: T? {
    if isEmpty {
      return nil
    }
    return input.isEmpty ? output.first! : input.last!
  }

  mutating func appendLeft(_ element: T) { //기존 큐의 enqueue
    input.append(element)
  }
  
  mutating func popRight() -> T? { //기존 큐의 dequeue
    if output.isEmpty {
        output = input.reversed() //output에 reverse한 배열 넣고 input 비우기
        input.removeAll()
    }
    return output.popLast() //없으면 nil 반환
  }

  mutating func appendRight(_ element: T) {
    output.append(element)
  }

  mutating func popLeft() -> T? {
    if input.isEmpty {
        input = output.reversed()
        output.removeAll()
    }
    return input.popLast() //없으면 nil 반
  }
}

let N = Int(readLine()!)!
var temp:[String] = []
var q = Dequeue<Int>()

for _ in 0..<N {
  temp = readLine()!.split(separator:" ").map { String($0) }

  switch temp[0] {
    case "push_front":
      q.appendRight(Int(temp[1])!)
    case "push_back":
      q.appendLeft(Int(temp[1])!)
    case "pop_front":
      print(q.isEmpty ? -1 : q.popRight()!)
    case "pop_back":
      print(q.isEmpty ? -1 : q.popLeft()!)
    case "size":
      print(q.size)
    case "empty":
      print(q.isEmpty ? 1 : 0)
    case "front":
      print(q.isEmpty ? -1 : q.first!)
    case "back":
      print(q.isEmpty ? -1 : q.last!)
    default:
    break
  }
}