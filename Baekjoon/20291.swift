let N = Int(readLine()!)!
var dic:[String:Int] = [:]

for _ in 0..<N {
  let input = readLine()!.split(separator:".").map { String($0) }
  dic[input[1], default:0] += 1
}

for (key, value) in dic.sorted(by: { $0.0 < $1.0 }) {
  print("\(key) \(value)")
}