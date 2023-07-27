import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]
var board:[[String]] = []
var dna = ""

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

var dic:[String:Int] = [:]
var mx = 0

for i in 0..<m {
  dic = [:]
  for j in 0..<n {
    dic[board[j][i], default:0] += 1
  }

  mx = dic.values.max()!
  let sorted = dic.sorted(by: { $0.0 < $1.0 })
  if let index = sorted.firstIndex(where: { $0.1 == mx }) {
    dna += sorted[index].key
  }
}

let dnaArr = dna.map { String($0) }
var sum = 0

for i in 0..<n {
  for j in 0..<m {
    if dnaArr[j] != board[i][j] {
      sum += 1
    }
  }
}

print(dna)
print(sum)