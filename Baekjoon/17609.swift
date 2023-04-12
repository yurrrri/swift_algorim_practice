import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
  let input = readLine()!
  if String(input.reversed()) == input { //그 자체로 회문
    print(0)
  } else if { //유사 회문
    for i in 0..<input.count {
      input.remove(at: i)
      if String(input.reversed()) == input {
        print(1)
        break
      }
      input.insert(at: i)
    }
  } else {
    print(2)
  }
}