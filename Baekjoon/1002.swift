import Foundation

let t = Int(readLine()!)!
var arr:[Int] = []

for _ in 0..<t {
  arr = readLine()!.split(separator:" ").map { Int(String($0))! }
}

func bisect(_ start: Int, _ end: Int, _ num: Int) -> Int {
  var start = start
  var end = end
  var mid = (start + end) / 2

  while start <= end {
    if arr[mid]
  }

  return -1
}