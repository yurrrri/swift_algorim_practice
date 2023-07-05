import Foundation

var first = 0, second = 0
let n = Int(readLine()!)!
var left = 0, right = n-1
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var min = Int.max

while left < right {
  let cur_value = arr[left] + arr[right]
  if abs(cur_value) <= min {
    min = abs(cur_value)
    first = arr[left]
    second = arr[right]
  }

  // 이걸 위에 넣게 되면 최소값보다 작을때에만 움직이니까 모든 수를 체크할 수는 없음
  if cur_value <= 0 { // 더 키워야함
    left += 1
  } else {   // 더 작은값을 찾아야하므로
    right -= 1
  }
}

print(first, second)