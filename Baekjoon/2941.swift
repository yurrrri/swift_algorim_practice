import Foundation

var dic = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

var str = readLine()!

for i in dic{
  str = str.replacingOccurrences(of: i, with:"1")
}

print(str.count)