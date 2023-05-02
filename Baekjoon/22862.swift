import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0], k = input[1]

let arr = readLine()!.split(separator: " ").map{Int($0)!}

var left = 0
var right = 0
var count = 0 //홀수 횟수
var answer = 0 //최대값

while true {
  if count > k {
    if arr[left] % 2 == 1 { // 홀수면 빼주고 왼쪽 + 1
      count -= 1 
    }
    left += 1
  } else if right == n {
    break
  } else {
    if arr[right] % 2 == 1 { //홀수면 더해주고 오른쪽 + 1
      count += 1
    }
    right += 1
  }
  answer = max(answer, right-left-count) //길이를 구해야하므로 +1
}

print(answer)