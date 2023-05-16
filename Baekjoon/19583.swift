// //세트로 푼 경우
import Foundation

let seq = readLine()!.split(separator:" ").map { String($0) }
let s = seq[0], e = seq[1], q = seq[2]

var enter = Set<String>()
var exit = Set<String>()

while let input = readLine()?.split(separator:" ").map { String($0) } {
  if input.isEmpty {
    break
  }
  if input[0] <= s {
    enter.insert(input[1])
  } else if e...q ~= input[0] {
    exit.insert(input[1])
  } 
}

print(enter.intersection(exit).count)
//교집합 -> 조건에 맞게 들어옴과 동시에 떠난사람 교집합 구하기

//딕셔너리로 푼 경우
let input = readLine()!.split(separator: " ").map{ String($0) }
let s = input[0], e = input[1], q = input[2]
var dic:[String:Bool] = [:]

while let input = readLine()?.split(separator:" ").map { String($0) } {
  let time = input[0], nickname = input[1]

  if time <= s {
    dic[nickname] = false
  } else if e...q ~= time && dic[nickname] != nil {
    dic[nickname]! = true
  }
}

print(dic.filter { $0.value == true }.count)