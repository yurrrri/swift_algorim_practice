import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator:" ").map { Int(String($0))! }.sorted() //먼저 정렬해야함
let m = Int(readLine()!)!
var haveToFind = readLine()!.split(separator:" ").map { Int(String($0))! }

func bisect(_ start: Int, _ end: Int, _ num: Int) -> Int {
  var mid = (start + end) / 2
  var start = start
  var end = end
  
  while start <= end {
    mid = (start + end) / 2
    
    if cards[mid] == num {
      return 1
    }

    if cards[mid] < num {
      start = mid + 1
    } else {
      end = mid - 1
    }
  }
  return 0
}

print(haveToFind.map { String(bisect(0, cards.count-1, $0)) }.joined(separator:" "))