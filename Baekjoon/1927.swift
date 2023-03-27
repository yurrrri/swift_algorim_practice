struct Heap<T: Comparable> {
  var heap:[T] = []

  var count: Int {
    return heap.count - 1
  }

  var isEmpty: Bool {
    return heap.count <= 1
  }

  init() { }
  init(_ element: T){
    heap.append(element) //인덱스 1부터 시작하게 하기 위해서 2번 append
    heap.append(element)
  }

  mutating func push(_ element: T) {
    if heap.isEmpty { //비어있으면 노드 그 자체로 힙이므로 초기화 작업
      heap.append(element)
      heap.append(element)
      return
    }
    heap.append(element) //1. 일단 넣기

    var insertIndex = heap.count-1 //2. 마지막에 추가된 인덱스

    func isMoveUp(_ index: Int) -> Bool {
      if index <= 1 {
        return false
      }

      let parentIndex = index/2
      return heap[index] < heap[parentIndex] ? true:false
    }

    while isMoveUp(insertIndex) {
      let parentIndex = insertIndex / 2
      heap.swapAt(parentIndex, insertIndex) //바꾸고
      insertIndex = parentIndex //위로 계속 거슬러 올라감
    }
  }

  enum MoveStatus { case none, left, right }

  mutating func pop() -> T? {
    if heap.count <= 1 { return nil } // 비어있으면 nil 반환

    let poped = heap[1]
    heap.swapAt(1, heap.count-1) //루트 노드와 마지막꺼를 바꾸고, 마지막 자리를 비움
    heap.removeLast()

    func moveDown(_ index: Int) -> MoveStatus {
      let leftChildIndex = index * 2
      let rightChiledIndex = index * 2 
+ 1

      if leftChildIndex >= heap.count { //모든 자식노드가 없을 경우
        return .none
      }

      if rightChiledIndex >= heap.count { //왼쪽 자식노드만 있을 경우
        return heap[index] < heap[leftChildIndex] ? .none : .left 
      }

      // 왼쪽, 오른쪽 자식노드 모두 있을 경우 case 3개로 나뉘어서 비교 필요함
      // 왼족, 오른쪽 자식노드 모두 자기자신보다 클 때 -> 안바꿈
      if (heap[leftChildIndex] > heap[index]) && (heap[rightChiledIndex] > heap[index]) {
        return .none
      }

      //왼쪽, 오른쪽 자식노드 모두 자기자신보다 작을 때 -> 왼쪽/자식노드중에 더 작은거 반환
      if (heap[leftChildIndex] < heap[index]) && (heap[rightChiledIndex] < heap[index]){
        return heap[leftChildIndex] < heap[rightChiledIndex] ? .left : .right
      }

      //둘중 하나만 자기 자신보다 작을 경우
      if (heap[leftChildIndex] < heap[index]) || (heap[rightChiledIndex] < heap[index]){
        return heap[leftChildIndex] < heap[index] ? .left : .right
      }

      return .none
    }

    var popedIndex = 1
    while true {
      switch moveDown(popedIndex) {
        case .none:
          return poped
        case .left:
          let leftchildIndex = popedIndex * 2
          heap.swapAt(popedIndex, leftchildIndex)
          popedIndex = leftchildIndex
        case .right:
          let rightchildIndex = popedIndex * 2 + 1
          heap.swapAt(popedIndex, rightchildIndex)
          popedIndex = rightchildIndex
      }
    }
  }
}

let N = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 0..<N {
  let input = Int(readLine()!)!
  if input != 0 {
    heap.push(input)
  }
  else{
    if heap.isEmpty {
      print(0)
    }
    else{
      print(heap.pop()!)
    }
  }
}