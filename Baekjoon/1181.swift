import Foundation

let n = Int(readLine()!)!
var set:Set<String> = []

for _ in 0..<n {
  set.insert(readLine()!)
}

var array = Array(set).map { ($0, $0.count)}
// array.sort(by: { first, second in
//   if first.1 == second.1 {
//     return first.0 < second.0
//   }
//   else{
//     return first.1 < second.1
//   }
// })
array.sort(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 })

print(array.map { $0.0 }.joined(separator:"\n"))