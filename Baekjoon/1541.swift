var array = readLine()!.split(separator: "-").map { String($0) }
array = array.filter { $0 != "" } //공백제거
var sum = 0
var count = 0
var sum_array:[Int] = []

for i in array {
  count = i.split(separator:"+").map { Int($0)!}.reduce(0, +)
  sum_array.append(count)
}

if sum_array.count == 1 {
  print(sum_array.first!)
}
else{
  count = 0
  for i in 1...sum_array.count-1{
    count += sum_array[i]
  }
  print(sum_array.first! - count)
}