import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]  // 라이언 인형이 k개 이상 있는 가장 작은 집합
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var count = 0
var minValue = Int(1e9)

var start = 0
var end = 0

if arr[end] == 1 {
  count += 1
}

while end < n {
  if count < k { // 만족하지 못하면 오른쪽으로 밀어줌
    end += 1
    if end < n, arr[end] == 1 {
      count += 1
    }
  } else {
    minValue = min(minValue, end-start+1)
    
    if arr[start] == 1 {
      count -= 1
    }
    start += 1
  }
}

if minValue == Int(1e9) {
  print(-1)
} else {
  print(minValue)
}