import Foundation

var n = Int(readLine()!)!
var ans = 0
while true {
  if n>0 && n%5 == 0 { //5로 나누어질 때까지 일단 계속 5로 나누기
    ans += n/5
  }
  else {
    n -= 2
    ans+=1
  }

  if n<=0{ //0이면 계산 다함!
    break
  }
}

if n<0{ //음수라는거는 안나뉘어진다는 뜻
  print(-1)
}
else {
  print(ans)
}