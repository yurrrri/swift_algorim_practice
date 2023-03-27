let n = Int(readLine()!)!
var dic:[String:[String]] = [:]
var answer = 0
var temp = 0

for _ in 0..<n {
  let num = Int(readLine()!)!
  answer = 1
  temp = 0
  
  if num == 0 {
    print(0)
    continue
  }
  dic = [:]
  
  for _ in 0..<num {
    let input = readLine()!.split(separator:" ").map { String($0) }
    dic[input[1], default:[]].append(input[0])
  }

  dic.values.forEach {
    answer *= ($0.count+1)
  }
  print(answer-1)
}