import Foundation

let n = Int(String(readLine()!))!
var arr: [[Int]] = [[]]
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: n + 1)
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for i in 1...n {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + arr[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + arr[i][1]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + arr[i][2]
}

print(min(dp[n][0], dp[n][1], dp[n][2]))