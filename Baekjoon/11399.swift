let n = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var result = 0
var sum = 0

for i in times {
    sum += i
    result += sum
}

print(result)