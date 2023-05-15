func merge_sort(_ array: [Int]) -> [Int] {
  if array.count <= 1 { return array } //길이가 1이 될때까지 쪼갬

  let mid = array.count / 2

  let left_sorted = merge_sort(Array(array[..<mid])) //왼쪽 배열 ()
  let right_sorted = merge_sort(Array(array[mid...])) //오른쪽 배열
  return merge(left_sorted, right_sorted)
}

//쪼개진 left, right 배열을 합병 및 정렬
func merge(_ left: [Int], _ right:[Int]) -> [Int] {
  var i = 0, j = 0
  var sorted_list:[Int] = []

  while i<left.count && j<right.count {
    if left[i] < right[j] { //비교하며 더 작은것을 추가함
      sorted_list.append(left[i])
      i += 1
    }
    else {
      sorted_list.append(right[j])
      j += 1
    }
  }

  sorted_list += Array(left[i...]) + Array(right[j...]) //호시 남아있는 원소가 있으면 모두 추가

  return sorted_list
}

print(merge_sort([1, 3, 5, 2, 4, 6, 7]))