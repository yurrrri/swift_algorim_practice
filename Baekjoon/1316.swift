import Foundation

let n = Int(readLine()!)!
var answer = 0

for _ in 0..<n {
  let input = readLine()!.map { String($0) }
  var dic:[String:Int] = [:]
  var flag = false
  dic[input.first!] = 1

  for i in 1..<input.count {
    if dic[input[i]] != nil { //이미 수가 있으면 연속되었는지 확인
      if input[i-1] != input[i] {
        flag = true
        break
      }
      dic[input[i]]! += 1
    }
    else{
      dic[input[i], default:0] += 1
    }
  }
  if !flag { answer += 1 }
}

print(answer)