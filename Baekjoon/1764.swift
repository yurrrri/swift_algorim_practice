import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var set1 = Set<String>()
var set2 = Set<String>()

for _ in 0..<n {
  set1.insert(readLine()!)
}

for _ in 0..<m {
  set2.insert(readLine()!)
}

let intersection = set1.intersection(set2)
print(intersection.count)

print(Array(intersection).sorted().joined(separator:"\n"))