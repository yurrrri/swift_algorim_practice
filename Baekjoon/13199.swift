import Foundation

let t = Int(readLine()!)!
var p = 0, m = 0, f = 0, c = 0
  // 차례대로 치킨 가격, 치킨에 쓸 돈, 치킨을 공짜로 먹는데 필요한 쿠폰 수, 치킨 시키면 주는 쿠폰 수
for _ in 0..<t {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  p = input[0]
  m = input[1]
  f = input[2]
  c = input[3]
  simulation()
}

func simulation() {
  var sangeon = (count: m/p, coupon: (m/p)*c)
  var duyeong = (count: m/p, coupon: (m/p)*c)

  let duyeong_service = duyeong.coupon/f
  duyeong.count += duyeong_service

  while sangeon.coupon / f > 0 {
    var service = sangeon.coupon / f
    sangeon.count += service
    sangeon.coupon -= (service*f - service*c)
  }
  
  print(sangeon.count-duyeong.count)
}
