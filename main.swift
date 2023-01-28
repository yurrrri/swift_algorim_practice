let string = "aabbaccc"
let startIndex = string.index(string.startIndex, offsetBy: 0)
let endIndex = string.index(string.startIndex, offsetBy: 2)

print(string[startIndex...endIndex])