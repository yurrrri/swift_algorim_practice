import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]
let arr = Array(1...n)
var answer = ""

func permutation(_ nums:[Int], _ index: Int) {
  if nums.count == m {
    nums.forEach {
      answer += "\($0) "
    }
    answer += "\n"
    return
  }

  for i in index..<arr.count {
    permutation(nums + [arr[i]], i)
  }
}

permutation([], 0)
print(answer)