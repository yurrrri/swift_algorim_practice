import Foundation

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