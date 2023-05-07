let t = Int(readLine()!)!
var yonsei:[Int] = []
var goryeo:[Int] = []

var yonsei_sum = 0
var goryeo_sum = 0

for _ in 0..<t {
  for _ in 0..<9 {
    let input = readLine()!.split(separator:" ").map { Int($0)! }
    yonsei.append(input[0])
    goryeo.append(input[1])
  }

  yonsei_sum = yonsei.reduce(0, +)
  goryeo_sum = goryeo.reduce(0, +)

  print(yonsei_sum == goryeo_sum ? "Draw" : yonsei_sum < goryeo_sum ? "Korea" : "Yonsei")
}