import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }
var answer = 0
var visited = Array(repeating:false, count:n+1)

// func backtracking(_ depth: Int, _ sum: Int){
//   if sum > 0 {
//     answer = max(answer, depth)
//     return
//   }

//   for i in 0..<n {
//     // if !visited[i] {
//     //   visited[i] = true
//       backtracking(depth+1, sum + arr[i])
//       // visited[i] = false
//     // }
//   }
// }

// backtracking(0, 0)
for i in 0..<n {
  for j in i+1..<n {
    for k in j+1..<n {
      if arr[i] + arr[j] + arr[k] > 0 {
        answer = max(answer)
      }
    }
  }
}
print(answer)
