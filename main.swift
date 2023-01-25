let firstline = readLine()!.split(separator:" ").map { Int($0)! }
let secondline = readLine()!.split(separator:" ").map { Int($0)! }
let ball_count = firstline[0]

var result = (ball_count) * (ball_count-1) / 2

let dictionary = Dictionary.init(grouping: secondline, by: {$0})

for i in dictionary {
  if i.value.count >= 2 {
    result -= (i.value.count * i.value.count - 1) / 2
  }
}

print(result)