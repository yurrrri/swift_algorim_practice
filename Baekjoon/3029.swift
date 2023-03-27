import Foundation

var first = readLine()!.split(separator:":").map { Int(String($0))! }
var second = readLine()!.split(separator:":").map { Int(String($0))! }

if first == second {
  print("24:00:00")
  exit(0)
}

var answer:[Int] = []

for i in 0..<3 {
  answer.append(second[i]-first[i])
}

for i in stride(from:2, to:0, by:-1){ //거꾸로 역순 -> to는 포함하지 않음
  if answer[i] < 0 {
    answer[i] += 60
    answer[i-1] -= 1
  }
}
if answer[0] < 0 {
  answer[0] += 24
}

print(answer.map { String(format:"%02d", $0) }.joined(separator: ":"))