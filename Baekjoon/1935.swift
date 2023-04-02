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

// import Foundation

// let N = Int(readLine()!)!
// let input = readLine()!
// var stack:[Double] = []
// var numbers:[Double] = []

// for _ in 0..<N {
//   numbers.append(Double(readLine()!)!)
// }

// for i in input {
//   switch i {
//     case "*":
//     stack.append(stack.removeLast() * stack.removeLast())
//     case "+":
//     stack.append(stack.removeLast() + stack.removeLast())
//     case "/":
//     let first = stack.removeLast()
//     let second = stack.removeLast()
  
//     stack.append(second/first)
//     case "-":
//     let first = stack.removeLast()
//     let second = stack.removeLast()
  
//     stack.append(second-first)
//     default:
//     stack.append(numbers[Int(i.asciiValue!-Character("A").asciiValue!)])
//   }
// }

// print(String(format: "%.2f", stack.removeLast()))