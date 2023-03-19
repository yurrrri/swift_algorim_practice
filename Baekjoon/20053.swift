let N = Int(readLine()!)!
for _ in 0..<N {
  let T = Int(readLine()!)!
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  print("\(input.min()!) \(input.max()!)")
}