let S = readLine()!.map { String($0) }
var T = readLine()!.map { String($0) }

while T.count >= 1 {
  if S.count == T.count {
    if S == T {
      print(1)
    }
    else{
      print(0)
    }
    break
  }
  if T.last! == "A"{
    T.removeLast()
  } else {
    T.removeLast()
    T = T.reversed()
  }
}