struct Node {
  init(_ data: String, leftNode: String, rightNode: String) {
    self.data = data
    self.leftNode = leftNode
    self.rightNode = rightNode
  }
  
  let data: String
  let leftNode: String
  let rightNode: String
}

// 전위 순회
func preOrder(node: Node) {
    print(node.data, terminator: "") // terminator ':' not '='
    if node.leftNode != "." {
        preOrder(node: tree[node.leftNode]!)
    }
    if node.rightNode != "." {
        preOrder(node: tree[node.rightNode]!)
    }
}

// 중위 순회
func inOrder(node: Node) {
    if node.leftNode != "." {
        inOrder(node: tree[node.leftNode]!)
    }
    print(node.data, terminator: "")
    if node.rightNode != "." {
        inOrder(node: tree[node.rightNode]!)
    }
}

// 후위 순회
func postOrder(node: Node) {
    if node.leftNode != "." {
        postOrder(node: tree[node.leftNode]!)
    }
    if node.rightNode != "." {
        postOrder(node: tree[node.rightNode]!)
    }
    print(node.data, terminator: "")
}

let n = Int(readLine()!)!
var tree: [String:Node] = [:]
for _ in 0..<n {
  let nodes = readLine()!.split(separator: " ").map { String($0) }
  tree[nodes[0]] = Node(nodes[0], leftNode: nodes[1], rightNode: nodes[2])
}

let startNode = tree["A"]!
preOrder(node: startNode)
inOrder(node: startNode)
postOrder(node: startNode)
