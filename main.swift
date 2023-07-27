import Foundation

let n = Int(readLine()!)!

func permutation() -> [[Int]] {
  var result:[[Int]] = []
  var visited = Array(repeating:false, count: 9)
  let nums = Array(1...9)

  func permu(_ arr: [Int]) {
    if arr.count == 3 {
      result.append(arr)
      return
    }
    
    for i in 0..<9 {
      if !visited[i] {
        visited[i] = true
        permu(arr + [nums[i]])
        visited[i] = false
      }
    }
  }

  permu([])

  return result
}

let nums = permutation() // 모든 3자리수 순열 구함
var isSuccess = Array(repeating: true, count: nums.count)

for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let callNum = String(input[0]).map { Int(String($0))! }, strike = input[1], ball = input[2]

  // 모든 3자리수 숫자에서, strike와 ball이 일치하는 
  for (index, num) in nums.enumerated() {
      var checkStrike = 0
      var checkBall = 0

      for i in 0...2 {
        if callNum[i] == num[i] {
            checkStrike += 1
        } else if num.contains(callNum[i]) {
            checkBall += 1
        }
      }
    
      if !(strike == checkStrike && ball == checkBall) { //주어진 조건에 맞지않는 수들을 모두 제거 ("가능성이 있는 수 -> 전체 수-(가능성이 절대 없는 수)")
          isSuccess[index] = false
      }
  }
}

print(isSuccess.filter { $0 }.count)