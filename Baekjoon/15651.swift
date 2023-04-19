import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let nums = Array(1...n)
var str:[String] = []
var visited = Array(repeating: false, count: n)

func permute(_ arr:[Int]){
  if arr.count == m {
    str.append(arr.map { String($0 )}.joined(separator:" "))
    return
  }
  
  for i in 0..<nums.count {
    permute(arr + [nums[i]])
  }
}

permute([])
print(str.joined(separator:"\n"))