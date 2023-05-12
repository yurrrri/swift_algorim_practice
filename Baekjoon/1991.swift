let n = Int(readLine()!)!
var nodes: [String: (leftNode: String, rightNode: String)] = [:]
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let node = input[0], left = input[1], right = input[2]
    nodes[node] = (leftNode: left, rightNode: right)
}

func preorder(node: String) { //전위 node: 실질적인 노드 + 깡통 노드도 포함
    if node == "." {
        return
    }
    print(node, terminator: "")
    preorder(node: nodes[node]!.leftNode)
    preorder(node: nodes[node]!.rightNode)
}

func inorder(node: String) { //중위
    if node == "." {
        return
    }
    inorder(node: nodes[node]!.leftNode)
    print(node, terminator: "")
    inorder(node: nodes[node]!.rightNode)
}

func postorder(node: String) { //후위
    if node == "." {
        return
    }
    postorder(node: nodes[node]!.leftNode)
    postorder(node: nodes[node]!.rightNode)
    print(node, terminator: "")
    
}

preorder(node: "A")
print()
inorder(node: "A")
print()
postorder(node: "A")