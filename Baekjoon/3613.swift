import Foundation

var str = readLine()!

func isJavaFormat(_ str: String) -> Bool {  // Java 포맷인지 판단하는 함수
  if str[0].isLowercase && !str.contains("_") {
    return true
  } else {
    return false
  }
}

func isCppFormat(_ str: String) -> Bool {  // C++ 포맷인지 판단하는 함수
  if str.contains("_") && str.allSatisfy({ $0.isLowercase || $0 == "_" }) && str.last! != "_" && str.first! != "_" && !str.contains("__") {  // _는 단어와 단어 사이를 구분하는 구분자이기 때문에, 첫번째나 마지막에 오면 C++ 포맷이 아님
    return true
  } else {
    return false
  }
}

if isJavaFormat(str) { // JAva -> C++
  var temp = ""
  for s in str {
    if s.isUppercase {
      temp += "_"
      temp += s.lowercased()
    } else {
      temp += String(s)
    }
  }
  print(temp)
} else if isCppFormat(str) { // C++ -> Java
  var temp = ""
  var flag = false
  for s in str {
    if s == "_" {
      flag = true
    } else {
      if !flag {
        temp += String(s)
      } else {
        temp += s.uppercased()
        flag = false
      }
    }
  }
  print(temp)
} else {
  print("Error!")
}

extension String {
  subscript(_ index:Int) -> Character {
    return self[self.index(self.startIndex, offsetBy: index)]
  }
}