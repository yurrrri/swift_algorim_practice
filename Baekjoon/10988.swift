import Foundation

var input = readLine()!
print(Array(input.reversed()).map { String($0) }.joined() == input ? 1:0)