let input = readLine()!.map{ String($0) } //쪼개서 정수 배열로 저장
var sum = 0

if !input.contains("0"){
  print(-1)
}
else{
  for i in input {
    sum += Int(i)!
  }

  if sum%3 == 0 {
    print(input.sorted(by: >).joined())
  }
  else{
    print(-1)
  }
}