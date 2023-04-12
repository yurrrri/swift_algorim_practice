import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var result:[[Int]] = []

func combination(_ nums:[Int]) {
  func combi(_ index: Int, _ arr:[Int]){
    if arr.count == m {
      result.append(arr)
      return
    }

    for i in index..<nums.count {
      combi(i+1, arr + [nums[i]]) //i+1 (중복 없이)
    }
  }

  combi(0, [])
}

combination(Array(1...n))

for i in result {
  print(i.map { String($0) }.joined(separator:" "))
}