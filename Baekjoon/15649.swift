import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]
var result:[[Int]] = []

func permutation(_ nums:[Int]) {
  var visited = Array(repeating:false, count:nums.count)

  func permute(_ arr:[Int]) {
    if arr.count == m {
      result.append(arr)
      return
    }

    for i in 0..<nums.count {
      if !visited[i] {
        visited[i] = true
        permute(arr + [nums[i]])
        visited[i] = false
      }
    }
  }

  permute([])
}

permutation(Array(1...n))

for i in result {
  print(i.map { String($0) }.joined(separator:" "))
}