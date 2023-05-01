import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

let nums = readLine()!.split(separator:" ").map { Int(String($0))! }.sorted()
var result = ""
var visited = Array(repeating: false, count:nums.count)

func permutation(_ arr:[Int], _ index: Int) {
  if arr.count == m {
    result += arr.map { String($0) }.joined(separator:" ") + "\n"
    return
  }
  
  for i in 0..<nums.count {
    if !visited[i] {
      visited[i] = true
      permutation(arr + [nums[i]], i)
      visited[i] = false
    }
  }
}

permutation([], 0)
print(result)