let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0]
let M = input[1]
var dic:[String:String] = [:]

for _ in 0..<N {
  let read = readLine()!.split(separator:" ").map { String($0)}
  dic[read[0]] = read[1]
}

for _ in 0..<M {
  print(dic[readLine()!]!)
}