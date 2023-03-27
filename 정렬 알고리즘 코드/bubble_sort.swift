var array = [7, 10, 9, 1, 3]

func bubbleSort(_ array: inout [Int]){
  for _ in 0..<array.count {
    var isSorted = true
    for j in 0..<array.count-1 {
      if array[j] > array[j+1] {
        array.swapAt(j, j+1)
        isSorted = false
      }
    }

    //이미 정렬이 되었으므로 중간에 break
    if isSorted { break }
  }
}

bubbleSort(&array)
print(array)