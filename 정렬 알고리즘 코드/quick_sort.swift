var array = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]

func quickSort(_ array: [Int]) -> [Int] {
  if array.count <= 1 { return array }

  let pivot = array.first!
  let tail = Array(array[1...])

  let left_side = tail.filter { $0 <= pivot }
  let right_side = tail.filter { $0 > pivot }

  return quickSort(left_side) + [pivot] + quickSort(right_side)
}

print(quickSort(array))