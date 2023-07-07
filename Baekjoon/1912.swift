import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator:" ").map { Int($0)! }
var dp = arr

if n == 1 {
  print(arr[0])
  exit(0)
}

for i in 1..<n{
  dp[i] = max(dp[i], dp[i-1] + arr[i])
}

print(dp.max()!)