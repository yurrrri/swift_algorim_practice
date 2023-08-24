import Foundation

let nk = readLine()!.split(separator:" ").map { Int($0)! }
let n = nk[0], k = nk[1]  // n: 물건의 개수, k: 버틸 수 있는 무게

var dp = Array(repeating: Array(repeating:0, count: k+1), count:n+1) // x: 물건의 개수, y: 무게 / dp[x][y]: 현재 x번째 물건까지 판단했을 때의 가치의 최대값
var arr:[(Int, Int)] = [(0, 0)]
for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr.append((input[0], input[1]))
}

for i in 1...n {
  let (w, v) = arr[i] // 각 물건의 무게, 가치
  for j in 1...k {   // 배낭이 감당할 수 있는 무게 --> j보다 w가 작거나 같으면 물건을 넣을 수 있음
    if j >= w {  // 물건을 넣을 수 있는 상황이라면?
      dp[i][j] = max(dp[i-1][j], dp[i-1][j-w]+v)  // 이전값과 지금의 물건을 넣었을 때(j-w)를 비교
    } else {  // 물건을 넣을 수 없다면
      dp[i][j] = dp[i-1][j] // 이전 값 그대로 가져옴
    }
  }
}

print(dp[n][k])