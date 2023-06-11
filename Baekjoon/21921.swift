import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], x = input[1]
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var sum = 0
var stack_sum = [0]

for i in arr {
  sum += i
  stack_sum.append(sum) // 누적합 구하기
}

var start = 0
var prefix_sum:[Int] = []

while start+x <= n {
  prefix_sum.append(stack_sum[start+x]-stack_sum[start]) // 구간합 구하기
  start += 1
}

let max_val = temp.max()!

if max_val == 0 {
  print("SAD")
} else {
  print(max_val)
  print(temp.filter { $0 == max_val }.count)
}