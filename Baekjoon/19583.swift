// //세트로 푼 경우
func convertToMinute(str: String) -> Int {
    let t = str.split(separator: ":").map{Int(String($0))!}
    return t[0] * 60 + t[1]
}

let t = readLine()!.split(separator: " ").map{ convertToMinute(str: String($0)) }
let (S,E,Q) = (t[0],t[1],t[2]) //각각의 시간 저장

var enterSet: Set<String> = []
var leaveSet: Set<String> = []

while let input = readLine()?.split(separator: " ").map({String($0)}) {
    let time = convertToMinute(str: input[0]) //input으로 들어온 시간 분으로 변환
    let name = input[1]
    
    if (0...S).contains(time) {
        enterSet.insert(name)
    } else if (E...Q).contains(time) {
        leaveSet.insert(name)
    }
}

print(enterSet.intersection(leaveSet).count) //교집합 -> 조건에 맞게 들어옴과 동시에 떠난사람 교집합 구하기

//딕셔너리로 푼 경우
let input = readLine()!.split(separator: " ").map{ String($0) }
let s = input[0], e = input[1], q = input[2]
var dic:[String:Bool] = [:]

while let input = readLine()?.split(separator:" ").map { String($0) } {
  let time = input[0], nickname = input[1]

  if time <= s {
    dic[nickname] = false
  } else if e...q ~= time && dic[nickname] != nil {
    dic[nickname]! = true
  }
}

print(dic.filter { $0.value == true }.count)