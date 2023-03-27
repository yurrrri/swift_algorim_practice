struct Heap<T: Comparable> {
  var heap:[T] = []

  var count : Int {
    return heap.count-1
  }

  var isEmpty: Bool {
    return heap.count <=1
  }

  init() {}
  init(_ element:T){
    heap.append(element)
    heap.append(element)
  }

  mutating func push(_ element:T) {
    if isEmpty {
      heap.append(element)
      heap.append(element)
      return
    }
    heap.append(element)
    var insertedIndex = heap.count-1

    func isMoveUp(_ index:Int) -> Bool {
      if index <= 1 { //부모노드이면 false
        return false
      }
      let parentIndex = index/2
      return heap[index] > heap[parentIndex] ? true : false
    }

    while isMoveUp(insertedIndex){
      let parentIndex = index/2
      heap.swapAt(insertedIndex, parentIndex)
      insertedIndex = parentIndex
    }
  }
  
  mutating func pop() -> T? {
    if isEmpty {
      return nil
    }
    
    let poped = heap[1]
    heap.swapAt(1, heap.count-1)
    heap.removeLast()

    enum moveStatus { case none, left, right }

    func moveDown(_ index:Int) -> moveStatus {
      let leftchild = index * 2
      let rightchild = index * 2 +1

      if leftchild >= heap.count-1 {
        return .none
      }

      if rightchild >= heap.count -1 {
        return heap[index] > heap[leftchild] ? .none : .left
      }

      if (heap[leftchild] < heap[index]) && (heap[rightchild] < heap[index]) {
        return .none
      }

      if (heap[leftchild] > heap[index]) && (heap[rightchild] > heap[index]) {
        return heap[leftchild] < heap[rightchild] ? .left : .right
      }

      if (heap[leftchild] > heap[index]) || (heap[rightchild] > heap[index]) {
        return heap[leftchild] > heap[index] ? .left : .right
      }

      return .none
    }

    var popedIndex = 1
    while true {
      switch moveDown(popedIndex) {
        case .none:
          reutrn poped
      case .left:
          let leftChildIndex = poppedIndex * 2
          heap.swapAt(poppedIndex, leftChildIndex)
          poppedIndex = leftChildIndex
      case .right:
          let rightChildIndex = (poppedIndex * 2) + 1
          heap.swapAt(poppedIndex, rightChildIndex)
          poppedIndex = rightChildIndex
      }
    }
  }
}

let N = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 0..<N {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  for i in 0..<N {
    heap.insert(input[i])
  }
}

print(heap.heap[N])