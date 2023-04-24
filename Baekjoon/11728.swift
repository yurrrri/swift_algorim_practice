//시간초과

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

let a_arr = readLine()!.split(separator:" ").map { Int(String($0))! }
let b_arr = readLine()!.split(separator:" ").map { Int(String($0))! }

var a = 0
var b = 0

var arr:[Int] = []

while a < n && b < m {
  if a_arr[a] < b_arr[b] {
    arr.append(a_arr[a])
    a += 1
  } else if a_arr[a] >= b_arr[b] {
    arr.append(b_arr[b])
    b += 1
  }
}

while (a<n){
  arr.append(a_arr[a])
  a += 1
}

while (b<m){
  arr.append(b_arr[b])
  b += 1
}


print(arr.map { String($0) }.joined(separator:" "))