import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]
var nums = readLine()!.split(separator:" ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count:n)
var answer:Set<[Int]> = []

func permu(_ depth: Int, _ arr: [Int]) {
  if depth == m {
    answer.insert(arr)
    return
  }

  for i in 0..<n {
    if !visited[i] {
      visited[i] = true
      permu(depth+1, arr + nums[i])
      visited[i] = false
    }
  }
}

print(arr)

