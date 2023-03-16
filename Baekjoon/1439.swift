var input = readLine()!

var zerotoone = 0
var onetozero = 0

if input[0] == "1" {
  zerotoone += 1
}
else{
  onetozero += 1
}

for i in 0..<input.count-2 {
  if input[i] == 0 && input[i+1] == 1 && input[i+1] == input[i+2] {
    zerotoone += 1
  }
  else if input[i] == 1 && input[i+1] == 0 && input[i+1] == input[i+2] {
    onetozero += 1
  }
}

print(min(zerotoone, onetozero))