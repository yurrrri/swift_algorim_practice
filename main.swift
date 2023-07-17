import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], m = input[1]
var nums = readLine()!.split(separator:" ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count:n)
var answer:Set<[Int]> = []

func permu(_ depth: Int, _ arr: [Int]) {
  if depth == m {
    if !answer.contains(arr) { // array를 set로 바꿔서 시간초과 해결 -> contains가 O(n)이 아닌 O(1)
       answer.insert(arr)
      print(arr.map { String($0) }.joined(separator:" "))
    }
    return
  }

  for i in 0..<n {
    if !visited[i] {
      visited[i] = true
      permu(depth+1, arr + [nums[i]])
      visited[i] = false
    }
  }
}

permu(0, [])
