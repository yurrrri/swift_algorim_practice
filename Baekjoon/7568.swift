import Foundation

let n = Int(readLine()!)!
var arr:[(Int, Int)] = []
for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  arr.append((input[0], input[1]))
}

for i in 0..<arr.count {
  var seq = 1
  for j in 0..<arr.count {
    if arr[i].0 < arr[j].0 && arr[i].1 < arr[j].1 {
      seq += 1
    }
  }
  print(seq, terminator: " ")
}