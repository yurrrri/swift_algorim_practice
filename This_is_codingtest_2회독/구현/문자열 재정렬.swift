let input = readLine()!

let alpha = input.filter { !$0.isNumber }.map { String($0) }
let number = input.filter { $0.isNumber }.map { Int(String($0))! }

print("\(alpha.sorted().joined())\(number.reduce(0, +))")