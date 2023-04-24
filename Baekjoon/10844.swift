import Foundation

var dp = Array(repeating:0, count:101)
dp[1] = 9
dp[2] = 17

var answer = 0
for i in 100...999 {
  var j = String(i).map { Int(String($0))! }
  if j[1]-j[0] == 1 && j[2]-j[1] == 1 {
    answer += 1
  }
}
print(answer)