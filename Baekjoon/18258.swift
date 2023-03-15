struct Queue<T> {
  var elements:[T?] = []

  var isEmpty: Bool {
    return elements.isEmpty
  }

  var size: Int {
    return elements.count
  }

  mutating func enqueue(_ element: T){
    elements.append(element)
  }
  
  mutating func dequeue() -> T? {
    if elements.isEmpty {
      return
    }
    return elements.removeFirst()
  }

  func front() -> T? {
    if isEmpty {
      return nil
    }
    return elements.fisrt!
  }

  func back() -> T? {
    if isEmpty {
      return nil
    }
    return elements.last!
  }
}

let N = Int(readLine()!)!
var temp:[String] = []
var queue = Queue<Int>()

for _ in 0..<N {
  temp = readLine()!.split(separator:" ").map { String($0) }
  switch temp[0] {
    case "push":
    queue.enqueue(Int(temp[1])!)
    case "pop":
    let poped = queue.dequeue()
    print(poped != nil ? poped! : -1)
    case "size":
    print(queue.size)
    case "empty":
    print(queue.isEmpty ? 1:0)
    case "front":
    print(queue.front() != nil ? queue.front()! : -1)
    case "back":
    print(queue.back() != nil ? queue.back()! : -1)
    default:
    break
  }
}