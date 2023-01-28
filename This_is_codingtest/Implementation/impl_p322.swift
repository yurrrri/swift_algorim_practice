let letters = readLine()!.map { String($0) }
var alpha:[String] = []
var number:[Int] = []

for i in letters {
  if Character(i).isNumber {
    number.append(Int(i)!)
  }
  else{
    alpha.append(i)
  }
}

alpha.sort()
print(alpha.joined() + String(number.reduce(0, +)))
