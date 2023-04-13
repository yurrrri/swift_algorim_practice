import Foundation

let n = Int(readLine()!)!
var bulb_list = [0] + readLine()!.split(separator:" ").map { Int(String($0))! }

let m = Int(readLine()!)!

for _ in 0..<m {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let gender = input[0], num = input[1]

  if gender == 1 { //남학생
    for i in 1...n {
      if i%num == 0 {
        bulb_list[i] = 1-bulb_list[i]
      }
    }
  } else { //여학생
    var po1 = num-1
    var po2 = num+1
    bulb_list[num] = 1-bulb_list[num]
    while 1...n ~= po1 && 1...n ~= po2 { //po1와 po2가 범위안에 드는지 판단
      if bulb_list[po1] == bulb_list[po2] {
        bulb_list[po1] = 1-bulb_list[po1]
        bulb_list[po2] = 1-bulb_list[po2]
        po1 -= 1
        po2 += 1
      }
      else{
        break
      }
    }
  }
}

if bulb_list.count <= 21 {
  bulb_list.removeFirst()
  print(bulb_list.map {String($0)}.joined(separator:" "))
} else {
  for i in 1...n {
    print(bulb_list[i], terminator:" ")
    if i>1 && i%20 == 0 {
      print()
    }
  }
}