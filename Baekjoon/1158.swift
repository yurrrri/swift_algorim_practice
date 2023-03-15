let input = readLine()!.split(separator:" ").map{ Int(String($0))! }
let N = input[0]
let k = input[1]

var result:[Int] = []
var array = Array(1...N)
var index = k-1

while !array.isEmpty {
    if index >= array.count {
        index %= array.count
    }
    
    let value = array.remove(at: index)
    result.append(value)
    index += (k-1)
}

print("<" + result.map{String($0)}.joined(separator: ", ") + ">")