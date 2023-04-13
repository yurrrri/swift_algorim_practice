import Foundation

let n = Int(readLine()!)!
let money_list = readLine()!.split(separator:" ").map { Int(String($0))! }.sorted()
let limit = Int(readLine()!)!
var start = 1
var end = money_list.max()!
var mid = 0
var answer = 0
var sum = 0

while start <= end {
  mid = (start + end) / 2
  sum = 0
  
  for i in money_list {
    sum += min(mid, i) //둘중 더 작은값 더하기
  }

  if sum > limit {
    end = mid - 1
  } else {
    start = mid + 1
    answer = mid
  }
}

print(answer)