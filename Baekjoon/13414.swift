let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let k = input[0]
let l = input[1]
var dic:[String:Int] = [:]

for i in 0..<l {
  let input = readLine()!
  dic[input] = i //딕셔너리로 하면 기존걸 덮어버림
}

let arr = dic.sorted(by: { $0.value < $1.value })
if dic.count < k { //3명이 정원인데 1명만 수강신청했을 경우 혹은 1명만 계속 신청했을 경우를 고려해야함
  for i in 0..<dic.count {
    print(arr[i].key)
  }
}
else{
  for i in 0..<k {
    print(arr[i].key)
  }
}