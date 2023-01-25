let N = Int(readLine()!)
let coins = readLine()!.split(separator: " ").map { Int($0)! }

//1. 첫번째 풀이 -> 모든 경우의 수를 커버하지 못함
// var temp = 0
// var temp_array:[Int] = []

// for i in 0...coins.count-2 {
//   temp = coins[i]
//   temp_array.append(coins[i])
//   for j in i+1...coins.count-1 {
//     temp += coins[j]
//     temp_array.append(temp)
//   }
// }

// temp_array.sort()
// for i in 1...temp_array.max()!{
//   if !temp_array.contains(i){
//     print(i)
//     break
//   }
// }

//2. 책 풀이
var target = 1
for x in coins{
  if target < x {
      break
  }
  target += x
}

print(target)

