let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0]
let M = input[1]
var dic1:[Int:String] = [:]
var dic2:[String:Int] = [:]
var answer:[String] = []

for i in 1...N {
  let input = readLine()!
  dic1[i] = input
  dic2[input] = i
}

for _ in 0..<M {
  let input = readLine()!
  if input.first!.isLetter { //문자 -> 인덱스
    answer.append(String(dic2[input]!)!)
  }
  else{
    answer.append(dic1[Int(input)!]!)
  }
}

print(answer.joined(separator:"\n"))