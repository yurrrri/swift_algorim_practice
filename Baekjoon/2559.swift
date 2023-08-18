import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let n = input[0], k = input[1]
let arr = readLine()!.split(separator:" ").map { Int($0)! }

var start = 0, end = k-1
var sum = arr[start...end].reduce(0, +), answer = -987654321

while true {
  if sum > answer {
    answer = sum
  }

  if end == n-1 {  //이미 끝까지 다 비교했고, 인덱스를 넘어서면 안되니까 여기서 break
    break
  }
  sum -= arr[start]  // 그 다음 합을 구하기 위해서 start, end 각각 이동
  start += 1
  end += 1
  sum += arr[end]
}

print(answer)