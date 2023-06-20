import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var dic:[Int:Int] = [:]
for i in 1...n {
  dic[i] = 0
}

for _ in 0..<m {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  dic[input[1]]! += 1
}

let sortedDic = dic.sorted(by: { $0.value <= $1.value })
for i in sortedDic {
  print(i.key, terminator:" ")
}