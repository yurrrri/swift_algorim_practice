import Foundation

let n = Int(readLine()!)!
var dic:[Int:Int] = [:]
var answer = 0

for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let num = input[0], dr = input[1]

  if dic[num] == nil {
    dic[num] = dr
  }
  else{ //이미 값이 있으면 기존값과 비교
    if dic[num]! != dr {
      answer += 1
      dic[num] = dr
    }
  }
}

print(answer)