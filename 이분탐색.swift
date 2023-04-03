func binary_search(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int? {
  var start = start
  var end = end
  var mid = 0
  
  while start <= end {
    mid = (start+end) / 2

    if arr[mid] == target {
      return arr[mid]
    }
    else if arr[mid] < target { //찾고자 하는 수가 중간점보다 뒤에 있다면, 시작점을 중간점 뒤로
      start = mid + 1
    }
    else { //찾고자 하는 수가 중간점보다 앞에 있다면, 끝점을 중간점 앞으로
      end = mid - 1
    }
  }
  return nil
}

var arr = [1, 2, 3, 5, 6, 7, 9]
print(binary_search(arr, 7, 0, arr.count-1))