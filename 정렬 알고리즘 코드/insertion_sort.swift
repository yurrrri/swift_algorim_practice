var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

func insertionSort(_ array: inout [Int]){
  for i in 1..<array.count { //앞은 이미 정렬되어있다고 가정하기때문에 2번째부터 시작함(첫번째 원소는 이미 정렬되어있음)
    for j in stride(from:i, to:0, by:-1){
      if array[j] < array[j-1] {
        array.swapAt(j-1, j)
      }
      else{
        break
      }
    }
  }
}

insertionSort(&array)
print(array)