import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  let west = input[0], east = input[1]
  simulation(west, east)
}

func simulation(_ west:Int, _ east:Int) {
  var dp = Array(repeating: Array(repeating: 0, count:31), count:31)
  for i in 1...west {
    for j in 1...east {
      if i == 1 {
        dp[i][j] = j
      } else if i == j {
        dp[i][j] = 1
      } else if i < j {
        dp[i][j] = dp[i-1][j-1] + dp[i][j-1]
      }
    }
  }
  print(dp[west][east])
}