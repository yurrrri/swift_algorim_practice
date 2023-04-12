import Foundation

let n = Int(readLine()!)!

//투포인터 알고리즘 (앞 -> 뒤 <- 이렇게해서 같은지 판단)
func possiblePalindrome(_ word: [String], _ left: Int, _ right: Int) -> Bool {
  var left = left
  var right = right
  
  while left < right {
    if word[left] != word[right] {
      return false
    }
    left += 1
    right -= 1
  }
  return true
}

for _ in 0..<n {
  var input = readLine()!.map { String($0) }
  var left = 0
  var right = input.count - 1

  if input.reversed() == input {
    print(0)
  } else {
    while left < right {
      if input[left] != input[right] { //양끝 짝이 서로 다르면, 특정 문자 제외 시 범위 내 palindrome인 부분이 있는지를 판단
        if possiblePalindrome(input, left+1, right) || possiblePalindrome(input, left, right-1) {
          print(1)
          break
        }
        else { //둘다 해당이 안되면 회문이 될 수 없는 알파벳
          print(2)
          break
        }
      } 
      left += 1
      right -= 1
    }
  }
}