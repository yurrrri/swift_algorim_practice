import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var doubleLine:[[Double]] = []  // 나누는 값이 소수점이 나올 수 있고, 이 중에 정수만 저장해야 하므로 따로 line을 Double형으로 변환한 배열 저장
    for i in line {
        doubleLine.append(i.map { Double($0) })
    }
    var line = doubleLine

    var arr:[(Int, Int)] = []  // 교점인 좌표를 저장할 배열
    var x = 0.0, y = 0.0
    
    for i in 0..<line.count-1 {
        for j in i+1..<line.count {
            if ((line[i][0] * line[j][1]) - (line[i][1] * line[j][0])) != 0 {
        x = (line[i][1]*line[j][2] - line[i][2]*line[j][1]) / (line[i][0]*line[j][1] - line[i][1]*line[j][0])
        y = (line[i][2]*line[j][0] - line[i][0]*line[j][2]) / (line[i][0]*line[j][1] - line[i][1]*line[j][0])
        if floor(x) == x, floor(y) == y { // 소수점 자른것과 자기 자신이 같으면 정수라는 의미
            arr.append(((Int(x), Int(y))))  // 정수로 변환해서 저장
            
        }
        }
    }
    }
    
    var minX = Int(1e11), minY = Int(1e11), maxX = -Int(1e11), maxY = -Int(1e11)
    // *을 포함한 범위만 그래프로 표시하기 위한 최소~최대 x / y 범위
    // 최소 최대 범위에 따라서 시간복잡도가 달라질 수 있으므로 설정에 유의해야함
    // 1e10가 범위인 이유? : 각 좌표가 -100,000~100,000(-1e5 ~ 1e5) 일 때 교점을 구하는 식에서 이를 서로 곱하면 최대 -1e5 x 1e5 = 1e10이 나오므로 이런 부분까지 고려하여 범위를 세워야함
    var nx = 0, ny = 0
    var result:[[String]] = []
    var answer:[String] = []
    
    for (x, y) in arr {
        minX = min(x, minX)
        maxX = max(x, maxX)
        minY = min(y, minY)
        maxY = max(y, maxY)
    }
    
    for _ in 0..<maxY-minY+1{
        result.append(String(repeating: ".", count:maxX-minX+1).map { String($0) })
    }

    // nx, ny 식의 의미
    // 모든 좌표를 0, 0 이상인 곳 (1사분면)으로 옮기는 식
    for (x, y) in arr {
        nx = x - minX
        ny = y - minY
        result[ny][nx] = "*"  // 수학에의 x/y축과 배열에서의 x/y축은 다르므로 바꿔줘야함
    }
        
    for i in result {
        answer.append(i.reduce("", +))
    }
    
    return answer.reversed()
}