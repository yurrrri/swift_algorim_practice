import Foundation

let _ = readLine()!
var arr = readLine()!.split(separator:" ").map { Double($0)! }.sorted()
var answer = 0.0

while !arr.isEmpty {
  let first = arr.removeLast()

  if arr.isEmpty {
    answer = first
    break
  }

  var second = arr.removeLast()

  arr.append(first + second / 2)
}

if answer == 0 {
  print(arr.first!)
} else {
  print(answer)
}