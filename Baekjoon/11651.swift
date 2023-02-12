let N = Int(readLine()!)!
var arr:[(Int, Int)] = []
var temp:[Int] = []

for _ in 0..<N {
  temp = readLine()!.split(separator:" ").map { Int(String($0))! }
  arr.append((temp[0], temp[1]))
}

arr = arr.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 })

for (x, y) in arr {
  print("\(x) \(y)")
}