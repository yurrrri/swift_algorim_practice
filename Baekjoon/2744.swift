import Foundation

var input = readLine()!
var converted = input.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }
print(converted.joined())