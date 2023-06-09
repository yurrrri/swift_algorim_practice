import Foundation

let n = Int(readLine()!)!
var arr:[(Int, Int)] = []

for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr.append((input[0], input[1])) // 각각 시작시간, 끝나는 시간
}

// 시작하는 시간 먼저, 빨리 끝나는 시간 먼저
// var temp = arr.sorted(by: { $0.0 < $1.0 && $0.1 < $1.1 })
// 이렇게 하면 안되는 이유: 위는 2가지 표현식을 모두 만족해야만 정렬을 하고, 아니면 정렬을 안하기 때문
arr = arr.sorted(by: { $0.0 < $1.0 }).sorted(by: { $0.1 < $1.1 })

// print(arr)

var stack = [arr[0]]

for i in 1..<arr.count {
  if arr[i].0 >= stack.last!.1 {  // 끝나자마자 시작할 수도 있으므로 >가 아닌 >=
    stack.append(arr[i])
  }
}

print(stack.count)