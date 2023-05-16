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
var dp = Array(repeating: 0, count:50001)

func checkDouble(_ i: Int) -> Bool {
  if floor(sqrt(Double(i))) == sqrt(Double(i)) {
    return true
  } else {
    return false
  }
}

for i in 1...n {
  if checkDouble(i) {
    dp[i] = 1 //제곱수이면 1이 최소값
  } else {
    var minValue = Int.max
    var j = 1
    while j * j <= i { // 제곱했을 때 i의 범위를 벗어나지 않을 때,
        minValue = min(minValue, dp[i - j * j]) //특정 제곱수를 뺐을 때의 값 중 최소값에 + 1
        j += 1
    }
    dp[i] = minValue + 1 
  }
}

print(dp[n])