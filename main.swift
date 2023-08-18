import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], k = input[1]
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var sequence: [Int: Int] = [:] //수마다 중복횟수를 저장할 딕셔너리
var left = 0, right = 0
var result = 0 //최대값을 저장할 변수

while right < n {
  if sequence[arr[right], default:0] < k { //중복 횟수가 k보다 작으면 right 전진하벼 범위 늘리기
    sequence[arr[right], default:0] += 1
    right += 1
  } else { //크면 left 전진
    sequence[arr[left], default:0] -= 1  //중복 횟수가 k보다 크면, 범위를 줄이기 위해 left 전진하며 이전 수 제외
    left += 1
  }

  result = max(result, right - left)
}

print(result)