import Foundation

var n = Int(readLine()!)!

func isPrime(_ num: Int) -> Bool {
  if num < 4 {
    return num <= 1 ? false : true
  }

  for i in 2...Int(sqrt(Double(num))) {
    if num%i == 0 { return false}
  }
  return true
}

func isPalindrome(_ num:Int) -> Bool {
  let arr = String(num).map { String($0) }
  if arr == arr.reversed() {
    return true
  } else { return false }
}

var arr:[Int] = []

while true {
  if isPrime(n) && isPalindrome(n) {
    print(n)
    exit(0)
  }
  n += 1
}