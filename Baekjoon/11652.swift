let n = Int(readLine()!)!
var dic:[Int:Int] = [:]

for _ in 0..<n {
  let num = Int(readLine()!)!
  if !dic.keys.contains(num) {
    dic[num] = 1
  }
  else{
    dic[num] = dic[num]! + 1
  }
}

// let sorted = dic.sorted(by: { 
//   if $0.1 == $1.1 {
//     return $0.0 < $1.0
//   }
//   else{
//     return $0.1 > $1.1
//   }
// })
let sorted = dic.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })
print(sorted[0].key)