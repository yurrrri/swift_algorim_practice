import Foundation

var input = readLine()!.lowercased().map { String($0) }
var dic:[String:Int] = [:]

for i in input {
  dic[i, default:0] += 1
}

var max = 0
var max_key = ""
for (key, value) in dic {
  if max < value {
    max = value
    max_key = key
  }
}

if dic.values.filter { $0 == max }.count >= 2 {
  print("?")
}
else{
  print(max_key.uppercased())
}