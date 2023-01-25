var array = readLine()!.components(separatedBy:"")
var result = Int(array[0])

for i in 1...array.count-1{
    if result == 0 || result == 1 {
        result += Int(array[i])
    }
    else{
        result *= Int(array[i])
    }
}

print(result)