let N = Int(readLine()!)!
var answer = Int.max

for i in 1...N {
  let num = i + String(i).map { Int(String($0))! }.reduce(0, +)
  if num == N {
    answer = min(answer, i)
  }
}

if answer == Int.max {
  print(0)
}
else{
  print(answer)
}