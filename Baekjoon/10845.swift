struct Queue<T> {
  var input:[T] = []
  var output:[T] = []

  var size: Int {
    return input.count + output.count
  }

  var isEmpty: Bool {
    return input.isEmpty && output.isEmpty
  }

  mutating func enqueue(_ element: T) {
    input.append(element)
  }

  mutating func dequeue() -> T? {
    if output.isEmpty {
      output = input.reversed()
      input.removeAll()
    }

    return output.popLast()
  }

  var front: T? {
    if isEmpty {
      return nil
    }
    return output.isEmpty ? input.first! : output.last!
  }

  var back: T? {
    if isEmpty {
      return nil
    }
    return input.isEmpty ? output.first! : input.last!
  }
}

let N = Int(readLine()!)!
var q = Queue<Int>()

for _ in 0..<N {
  let input = readLine()!.split(separator:" ").map { String($0) }

  switch input.first! {
    case "push":
    q.enqueue(Int(input[1])!)
    case "pop":
    print(q.isEmpty ? -1 : q.dequeue()!)
    case "size":
    print(q.size)
    case "empty":
    print(q.isEmpty ? 1:0)
    case "front":
    print(q.isEmpty ? -1 : q.front!)
    case "back":
    print(q.isEmpty ? -1 : q.back!)
    default:
    break
  }
}