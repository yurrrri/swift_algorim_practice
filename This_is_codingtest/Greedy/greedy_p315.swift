let firstline = readLine()!.split(separator:" ").map { Int($0)! }
let ball_count = firstline[0]
let max_kg = firstline[1]
var result = ball_count * (ball_count-1) / 2
var dictionary = Dictionary.init(grouping: firstline)

for i in dictionary {
  if i.value.count >= 2 {
    result -= (i.value.count * i.value.count-1 / 2)
  }
}

print(result)