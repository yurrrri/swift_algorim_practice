import Foundation

let N = Int(readLine()!)!
let input = readLine()!
var num_input:[Double] = []
for _ in 0..<N{
  num_input.append(Double(readLine()!)!)
}
var nums:[Double] = []

for i in input {
  switch i {
    case "*":
    nums.append(nums.removeLast() * nums.removeLast())
    case "+":
    nums.append(nums.removeLast() + nums.removeLast())
    case "/":
    let first = nums.removeLast()
    let second = nums.removeLast() 
    nums.append(second/first) //이전 애한테 나누어야함    
    case "-":
    let first = nums.removeLast()
    let second = nums.removeLast() 
    nums.append(second-first) //이전 애한테 빼야됨
    default: //숫자일때
    let num = num_input[Int(i.asciiValue! - Character("A").asciiValue!)]
    nums.append(num)
    break
  }
}

print(String(format: "%.2f", nums.first!))