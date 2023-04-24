import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], x = input[1]
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var sum = 0
var prefix_sum = [0]

for i in arr {
  sum += i
  prefix_sum.append(sum)
}

var start = 0
var temp:[Int] = []

while start+x <= n {
  temp.append(prefix_sum[start+x]-prefix_sum[start])
  start += 1
}

let max_val = temp.max()!

if max_val == 0 {
  print("SAD")
} else {
  print(max_val)
  print(temp.filter { $0 == max_val }.count)
}