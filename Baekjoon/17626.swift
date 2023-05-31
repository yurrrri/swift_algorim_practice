import Foundation

//ver 1
var N = Double(readLine()!)!
if floor(sqrt(N)) == sqrt(N) { //자기 자신이 제곱수일때 
  print(1)
  exit(0)
}

for i in 0...Int(sqrt(N)) { //N-i^2의 제곱근이 정수라면 2개 제곱의 합으로 되어있음 
  if floor(sqrt(N-Double(i*i))) == sqrt(N-Double(i*i)) {
    print(2)
    exit(0)
  }
}

for i in 0...Int(sqrt(N)){ //N-i^2-j^2의 제곱근이 정수라면 2개 제곱의 합으로 되어있음 
  for j in 0...Int(sqrt(N-Double(i*i))) {
    if floor(sqrt(Double(N-Double(i*i+j*j)))) == sqrt(Double(N-Double(i*i+j*j))) {
      print(3)
      exit(0)
    }
  }
}

print(4)

//ver2 - DP
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count:50001) // n을 구하기 위한 최소 제곱수의 합

func isSquareNum(_ n: Int) -> Bool {
    let root = Int(sqrt(Double(n))) //sqrt : 제곱근
    return root * root == n ? true:false
}

for i in 1...n {
  if isSquareNum(i) {
    dp[i] = 1
  } else {
    var j = 1
    var minValue = Int.max
    while j*j <= i { // i를 넘지않는 제곱수를 계산한 값중에 + 1
      minValue = min(minValue, dp[i-j*j])
      j += 1
    }
    dp[i] = minValue + 1
  }
}

print(dp[n])