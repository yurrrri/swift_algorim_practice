import Foundation

let input = readLine()!.filter { $0.isLetter }.map { String($0)}.joined()
let input2 = readLine()!

print(input.contains(input2) ? 1:0)