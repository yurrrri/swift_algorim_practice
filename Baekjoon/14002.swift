import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
var dp = Array(repeating:1, count:n) // i번째 오기까지의 가장 긴 수열의 길이

for i in 1..<n {
  for j in 0..<i {
    if arr[i] > arr[j] { // 자기보다 더 작은 수 만날때마다 갱신
      dp[i] = max(dp[i], dp[j] + 1)
    }
  }
}

var maxDp = dp.max()!
var maxIdx = 0 // 가장 긴 수열의 길이와 그 길이를 만족하기 위한 원소의 위치에서부터 시작
var answer: [Int] = []
var p = 1

while p < maxDp {
    if dp[maxIdx] == maxDp {
        answer.append(arr[maxIdx])
        maxDp -= 1
    }
    maxIdx += 1
}

print(answer.count)
print(answer.sorted().map { String($0) }.joined(separator:" "))