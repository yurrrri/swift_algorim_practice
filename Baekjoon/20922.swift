import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var sequence = Array(repeating:0, count:arr.max()!+1) //수마다 중복횟수를 저장할 배열
var left = 0, right = 0
var result = 0 //최대값을 저장할 변수

while right < n {
  if sequence[arr[right]] < k { //중복 횟수가 k보다 작으면 right 전진
    sequence[arr[right]] += 1
    right += 1
  } else { //크면 left 전진
    sequence[arr[left]] -= 1
    left += 1
  }

  result = max(result, right - left)
}

print(result)