import Foundation

let n = Int(readLine()!)!
var arr:[(Int, Int)] = [(0, 0)] // 껍데기

var dp = Array(repeating: 0, count:n+1) // 최대 수익 DP 테이블, i: 기간

for _ in 1...n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr.append((input[0], input[1])) // 상담을 하는데 필요한 기간, 이익
}

for i in 1...n {
  dp[i] = max(dp[i], dp[i-1])
  let dur = i + arr[i].0 - 1
  if dur <= n { // 퇴사 일 이후를 넘기지 않는지 확인
    dp[dur] = max(dp[i-1] + arr[i].1, dp[dur])
  }
}

print(dp.max()!)