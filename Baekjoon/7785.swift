let n = Int(readLine()!)!
var dic:[String:String] = [:]

for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { String($0) }
  if input[1] == "enter" {
    dic[input[0]] = "enter"
  } else {
    dic[input[0]] = nil //딕셔너리에서 해당 키를 가지고 있는 값을 삭제한다.
  }
}

print(dic.keys.sorted(by: >).joined(separator:"\n"))