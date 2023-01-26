let N = Int(readLine()!)!
var array:[Int] = []
for _ in 1...N {
  array.append(Int(readLine()!)!)
}
var answer = 0
var i = 0

if N == 1 {
  print(array.first!)
}
else{
  array.sort(by: >) //먼저 차례대로 정렬
  while true {
    if array.count >= 2 {
        if array[i] + array[i+1] > array[i] * array[i+1] {
      answer += array[i]
      array.removeFirst()
    }
    else{
      answer += array[i] * array[i+1]
      array.removeFirst()
      array.removeFirst()
    }
    }
    else if array.count == 1 {
      answer += array.first!
      array.removeFirst()
    }
    else{
      print(answer)
      break
    }
  }
}