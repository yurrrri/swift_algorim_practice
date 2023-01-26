let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let K = input[1]
var array:[Int] = []
var temp = K
var answer = 0

for _ in 0...N-1{
  array.append(Int(readLine()!)!)
}

for i in array.reversed() {
  if temp == 0 {
    break
  }
  answer += temp / i
  temp = temp%i
}

print(answer)