import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], s = input[1]
let arr = readLine()!.split(separator:" ").map { Int($0)! }

// N이 100만이기때문에 기존의 반복문 2개 + DP로 해결 불가
var start = 0, end = 0

while true {
  
}