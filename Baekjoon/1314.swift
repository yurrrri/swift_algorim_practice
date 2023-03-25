let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let k = input[0]
let l = input[1]
var dic:[String:Int] = [:]

for i in 0..<l {
  let input = readLine()!
  dic[input] = i //딕셔너리로 하면 기존걸 덮어버림
}

let arr = dic.sort(by: { $0.value < $1.value }).keys
for i in 0..<k {
  print(arr[i])
}
