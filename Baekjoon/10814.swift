import Foundation

let n = Int(readLine()!)!
var arr:[(Int, Int, String)] = []
var seq = 0

for _ in 0..<n {
  let input = readLine()!.split(separator:" ")
  arr.append((seq, Int(input[0])!, String(input[1])))
  seq += 1
}

arr.sort(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 })
arr.forEach {
  print($0.1, $0.2)
}