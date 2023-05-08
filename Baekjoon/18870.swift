let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var dic = [Int:Int]()

var rank = 0
for i in arr.sorted() {
  if dic[i] == nil { //겹치는거 제외하기 위함
    dic[i] = rank
    rank += 1
  }
}

print(arr.map { String(dic[$0]!) }.joined(separator:" "))