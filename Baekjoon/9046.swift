let N = Int(readLine()!)!
for _ in 0..<N {
  let input = readLine()!.filter { $0 != " " }.map { String($0) }
  var dic:[String:Int] = [:]

  input.forEach { dic[$0, default: 0] += 1 }

  // let sorted = dic.sorted(by: { $0.1 > $1.1 })
  // if sorted.count == 1 || sorted.first!.value != sorted[1].value {
  //   print(sorted.first!.key)
  // }
  // else{
  //   print(?)
  // }
  let max = dic.max(by: { $0.1 < $1.1 })!
  if dic.filter { $0.value == max.value }.count == 1 {
    print(max.key)
  }
  else{
    print("?")
  }
}