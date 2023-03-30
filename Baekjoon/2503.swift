//조합: 수의 순서가 바뀌면 서로 다른 수임
func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
  var result = [[Int]]()
  var visited = [Bool](repeating: false, count: nums.count)
  
  func permutation(_ nowPermute: [Int]) {
      if nowPermute.count == targetNum {
          result.append(nowPermute)
          return
      }
    
      for i in 0..<nums.count {
          if visited[i] == false {
              visited[i] = true
              permutation(nowPermute + [nums[i]])
              visited[i] = false
          }
      }
  }
  permutation([])
  
  return result
}

let N = Int(readLine()!)!
var nums = permute([1, 2, 3, 4, 5, 6, 7, 8, 9], 3)
var isSuccess = [Bool](repeating: true, count: nums.count)

for _ in 0..<N {
  
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let callNum = String(input[0]).map { Int(String($0))! }, strike = input[1], ball = input[2]

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

print(isSuccess.filter { $0 == true }.count)