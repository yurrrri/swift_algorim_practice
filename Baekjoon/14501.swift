import Foundation

let n = Int(readLine()!)!
var arr:[(Int, Int)] = [(0, 0)]
var dp = Array(repeating: 0, count: n+1)
// ~n날까지 진행했을 떄의 수익의 최대값

for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr.append((input[0], input[1]))  // 상담에 걸리는 날짜, 비용
}

for i in 1...n {
  // 상담 한것 vs 안한것 중에 최대값
  let dur = i + arr[i].0 - 1 // 상담이 끝나는 날
  if dur <= n { // 상담 안하기 vs 상담하는 날 중 최대값
    dp[dur] = max(dp[dur], dp[i-1] + arr[i].1)
  }
  // 상담을 진행했을 때 퇴사일을 넘어버른 경우 -> 상담을 못함
  // 못하는 경우에는 현재 값까지 해서 최대값을 가져오는 것이 현재의 DP값
  dp[i] = max(dp[i-1], dp[i])
}

print(dp.max()!)