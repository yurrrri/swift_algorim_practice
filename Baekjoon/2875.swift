let input = readLine()!.split(separator:" ").map { Int($0)! }
var woman = input[0]
var man = input[1]
let intern = input[2]

for _ in 0..<intern{
  if man <= woman/2 {
    woman -= 1
  }
  else{
    man -= 1
  }
}

print(min(woman/2, man))