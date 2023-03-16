let input = readLine()!.map { $0 }
let x = Int(String(input[1]))!
let y = Int(input[0].asciiValue! - Character("a").asciiValue! + 1)

let pos = [(-2, -1), (-2, 1), (2, -1), (2, 1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
var result = 0

for i in pos {
  if (1 <= x + i.0 && x + i.0 <= 8) && (1 <= y+i.1 && y+i.1 <= 8) {
    result += 1
  }
}

print(result)