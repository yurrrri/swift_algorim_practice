import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
  let fun = readLine()!.map { String($0) }
  let _ = Int(readLine()!)!
  let arr = readLine()!.split(whereSeparator: { $0 == "[" || $0 == "," || $0 == "]"})
  var isReverse = false
  var head = 0, tail = arr.count

  for i in fun {
    if i == "R" {
      isReverse.toggle()
      continue
    }

    if isReverse { // D인 상황에서, 뒤집혀져있는지 아닌지
      tail -= 1
    } else {
      head += 1
    }

    if head > tail { break }
  }

  if head > tail {
    print("error")
  } else {
    if isReverse {
      print("[\(Array(arr[head..<tail].reversed()).joined(separator:","))]")
    } else {
      print("[\(Array(arr[head..<tail]).joined(separator:","))]")
    }
  }
}