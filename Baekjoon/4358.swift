import Foundation

var dic:[String:Int] = [:]

while let input = readLine() {
  dic[input, default:0] += 1
}
var total = dic.values.reduce(0, +)
var answer:[(String, String)] = []

for (key, value) in dic {
  answer.append((key, String(format:"%.4f", Double(value)/Double(total) * 100)))
}

for (key, value) in answer.sorted(by: { $0.0 < $1.0 }) {
  print("\(key) \(value)")
}