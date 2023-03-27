var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

func selectionSort(_ array: inout [Int]) {
  for i in 0..<array.count {
    var min_index = i
    for j in i+1..<array.count {
      if array[j] < array[min_index] {
        min_index = j
      }
    }
    array.swapAt(min_index, i)
  }
}

selectionSort(&array)

print(array)