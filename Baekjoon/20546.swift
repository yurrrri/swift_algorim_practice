import Foundation

let n = Int(readLine()!)!
let money_list = readLine()!.split(separator:" ").map { Int(String($0))! }

var junhyun = (n, 0) //(현금, 주식 수)
var sungmin = (n, 0) //(현금, 주식 수)

for i in 0..<money_list.count {
  if money_list[i] <= n {
    junhyun.1 = n/money_list[i]
    junhuyn.0 -= (money_list[i]*junhyun.1)
  }

  if i>=2 {
    if money_list[i-2] > money_list[i-1] && money_list[i-1] > money_list[i] {
      sungmin.1 += n/money_list[i]
      sungmin.0 -= (money_list[i]*sungmin.1)
    } else if money_list[i-2] < money_list[i-1] && money_list[i-1] < money_list[i] {
      sungmin.0 += (money_list[i]*sungmin.1)
      sungmin.1 = 0 //전량 매도
    }
  }
}

var junhyun_sum = junhyun.0 + money_list.last! * junhyun.1
var sungmin_sum = sungmin.0 + money_list.last! * sungmin.1

if junhyun_sum > sungmin_sum {
  print("BNP")
} else if junhyun_sum == sungmin_sum {
  print("SAMESAME")
} else {
  print("TIMING")
}