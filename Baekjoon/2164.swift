import Foundation

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

  @discardableResult mutating func dequeue() -> T {
    if output.isEmpty {
      output = input.reversed()
      input.removeAll()
    }
    return output.removeLast()
  }

  var first: T? {
    if isEmpty {
      return nil
    }
    return output.isEmpty ? input.first! : output.last!
  }
}

let N = Int(readLine()!)!
if N==1 {
  print(1)
  exit(0)
}

var q = Queue<Int>()
q.input = Array(1...N)

while true {
   q.dequeue()

  if q.size == 1 {
    break
  }

  let poped = q.dequeue()
  q.enqueue(poped)
}

print(q.first!)