var s = readLine()!.map { String($0) }
var count0 = 0 // 모두 0으로 뒤집기
var count1 = 0 // 모두 1로 뒤집기

if s[0] == "1" {
    count0 += 1
}
else {
    count1 += 1
}
for i in 0...s.count-2 {
    if s[i] != s[i+1] { // 다음 수에서 1로 바뀌는 경우
        if s[i+1] == "1"{
            count0 += 1
        }
        else{ // 다음 수에서 0으로 바뀌는 경우
            count1 += 1
        }      
    }
}

print(min(count0, count1))

extension String {
  subscript(_ index:Int) -> Character {
      return self[self.index(self.startIndex, offsetBy: index)]
  } 
}