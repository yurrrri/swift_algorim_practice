import Foundation

let t = Int(readLine()!)!
var dp = Array(repeating: Array(repeating:0, count:30), count: 30)

for i in 0..<t {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let n = input[0], m = input[1]

  for i in 1...n{
    for j in 1...m{
      if i == j {
        dp[i][j] = 1
      }
      else if i == 1 {
        dp[i][j] = j
      }
      else if i < j {
        dp[i][j] = dp[i-1][j-1] + dp[i][j-1]
      }
    }
  }

  print(dp[n][m])
}