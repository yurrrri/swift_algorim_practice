import Foundation

var input:[String] = []

for _ in 0..<5 {
  input.append(readLine()!)
}

var max_len = input.map { $0.count }.max()!

for i in 0..<5{
  input[i] += String(repeating:" ", count:max_len-input[i].count)
}

var answerString = ""

for i in 0..<max_len {
  for j in 0..<5 {
    answerString += String(input[j][i])
  }
}

print(answerString.replacingOccurrences(of:" ", with:""))

extension String {
  subscript(_ index: Int) -> Character {
    return self[self.index(self.startIndex, offsetBy:index)]
  }
}