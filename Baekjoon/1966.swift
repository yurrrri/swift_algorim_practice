let T = Int(readLine()!)!

for _ in 0..<T{
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let _ = input[0]
  let seq = input[1]
  var answer = 0

  var importants = readLine()!.split(separator:" ").map { (find: false, num: Int(String($0))!) }
  importants[seq].find = true

  while true {
    let first = importants.first!

    //튜플 안의 num끼리 비교하여 num의 최대값을 가지는 튜플을 반환해줌
    if first.num != importants.max(by: { $0.num < $1.num })!.num {
      importants.append(importants.removeFirst())
    }
    else{
      
      let find = importants.removeFirst() //인쇄
      answer += 1

      if first.find == true { //만약에 인쇄한 애가 내가 찾는애라면?
        print(answer)
        break
      }
    }
  }
}