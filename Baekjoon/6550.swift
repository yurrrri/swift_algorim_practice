import Foundation

while var input = readLine(), input != "" {
  input = input.split(separator:" ")

  var s = input[0].map { String($0) }, t = input[1]
  print(s.filter { t.contains($0) })
}