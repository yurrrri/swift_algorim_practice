import Foundation
// 8->10->2진수 변환으로 풀기 어려운 이유는 10진수로 바꾸는 과정에서 int의 범위를 넘어선다 (길이가 333,334까지이기때문에 10진수로 변환하면 엄청 커짐)
// let input = readLine()!
// print(String(Int(input, radix:8)!, radix:2))

let input = readLine()!.map { Int(String($0))! }
var answer = String(input.first!, radix:2) //0으로 시작할 수 없으므로 첫번째 수만 2진수로 바꿈

for i in input[1...] {
  answer += String(format: "%03d", Int(String(i, radix: 2))!)
}

print(answer)