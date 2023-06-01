import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
var dp = arr // i번째 오기까지의 가장 긴 수열의 길이

for i in 1..<n{
  for j in 0..<i {
    if arr[i] > arr[j] {
      dp[i] = max(dp[i], dp[j] + arr[i])
      
    }
  }
}

print(dp.max()!)