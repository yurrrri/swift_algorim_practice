let N = Int(readLine()!)!
var array = readLine()!.components(separatedBy:" ").map { Int($0)! }
array.sort()

var result = 0

//1. 첫번째 풀이 -> 이거는 최대값부터 그룹을 만드는 형태이므로, 그룹의 갯수가 최소가 되도록 하는 방법임
// var count = N
// var temp = 0
// for _ in 0...N-1 {
//     temp = array.last!
//     if count/temp >= 1 {
//         result += 1
//         count -= temp
//     }
//     else {
//         break
//     }
//     array.removeLast()
// }

//2. 답안
var count = 0
for i in array {
    count += 1
    if count >= i {
      result +=1
      count = 0
    }
}

print(result)