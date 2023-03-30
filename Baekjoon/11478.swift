let input = readLine()!.map { String($0) }
var strings:Set<String> = []

for i in 0..<input.count {
  var string = ""
  for j in i..<input.count {
    string += input[j]
    strings.insert(string)
  }
}

print(strings.count)