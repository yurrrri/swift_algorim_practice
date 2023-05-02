import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var left = 0
var right = 1
var answer = 0

var first = 0
var second = 0

while true {
  if abs(arr[left] + arr[right]) > answer {
    left += 1
  } else if right == n {
    break
  } else {
    answer = abs(arr[left] + arr[right])
    first = arr[left]
    second = arr[right]

    right += 1
  }
}

print(first < second ? "\(first) \(second)" : "\(second) \(first)")