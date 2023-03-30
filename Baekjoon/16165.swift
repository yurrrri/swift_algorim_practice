let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0]
let M = input[1]
var dic:[String:[String]] = [:]

for _ in 0..<N {
  let teamName = readLine()!
  let teamNum = Int(readLine()!)!

  for _ in 0..<teamNum{
    dic[teamName, default:[]].append(readLine()!)
  }
}

for _ in 0..<M {
  let input = readLine()!
  let what = Int(readLine()!)!

  if what == 0 {
    print(dic[input]!.sorted().joined(separator: "\n"))
  } else {
    print(dic.filter { $0.value.contains(input) }.first!.key)
  }
}