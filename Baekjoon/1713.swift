import Foundation

let n = Int(readLine()!)!
let _ = readLine() //안쓰는 변수
let nums = readLine()!.split(separator:" ").map { Int(String($0))! }
//1. 풀이 
var stack:[Int] = [] //사진틀
var count:[Int] = Array(repeating:0, count:101) //추천횟수를 담을 배열

for i in nums {
  if stack.count == n {
    if !stack.contains(i){ //액자에 없는경우 추가해야함
      let min = count.filter { $0 != 0 }.min()!
    
      for j in stack {
        if count[j] == min {
          count[j] = 0
          if let index = stack.firstIndex(of: j){
            stack.remove(at: index)
          }
          break
        }
      }
      stack.append(i)
    }
  } else {
    if !stack.contains(i) { //사진 걸기
      stack.append(i)
    }
  }
  count[i] += 1
}
print(stack.sorted().map { String($0) }.joined(separator:" "))

//2. 고차함수 이용 풀이
// var photos:[(Int, Int)] = []

// for num in nums {
//   if photos.count == n {
//     if !photos.contains(where: { $0.0 == num }) {
//       let removed = photos.filter { $0.1 == photos.map { $0.1 }.min()! }.first!
//       photos.remove(at: photos.firstIndex { $0 == removed }!)
//       photos.append((num, 0))
//     }
//   } else {
//     if !photos.contains(where: { $0.0 == num }) {
//       photos.append((num, 0))
//     }
//   }
//   let firstIndex = photos.firstIndex { $0.0 == num }!
//   photos[firstIndex].1 += 1 //추천횟수 +1
// }

// print(photos.sorted(by: { $0.0 < $1.0 }).map { String($0.0) }.joined(separator:" "))