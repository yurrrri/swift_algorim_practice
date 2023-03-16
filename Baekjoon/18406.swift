let input = readLine()!.map { Int(String($0))! }

let len = input.count
let front = Array(input[0...(len/2)-1]).reduce(0, +)
let back = Array(input[len/2...len-1]).reduce(0, +)

if front == back {
  print("LUCKY")
}
else{
  print("READY")
}