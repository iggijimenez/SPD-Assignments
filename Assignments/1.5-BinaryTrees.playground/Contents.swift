import UIKit

//Given a binary search tree, reverse the order of its values by modifying the nodes’ links.

class Tree {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var queue = [(TreeNode?,  Int)]()
        var results = [Int: [Int]]()
        queue.append((root, 0))
        
        while !queue.isEmpty {
            var (current, level) = queue.removeFirst()
            if let value = current?.val {
                results[level, default: []].append(value)
            }
            if current?.left != nil {
                queue.append((current?.left, level + 1))
            }
            if current?.right != nil {
                queue.append((current?.right, level + 1))
            }
        }
        return results.sorted { $0.0 > $1.0 }.map{ Array($0.1) }
    }
}

//Given a binary search tree containing integers and a target integer, come up with an efficient way to locate two nodes in the tree whose sum is equal to the target value.

class Trees {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var nums: [Int] = []
        var cache: [Int: Bool] = [:]
        
        run(root, nums: &nums)
        
        for (i, num) in nums.enumerated() {
            if let value = cache[k - num] {
                return true
            }
            cache[num] = true
        }
        
        return false
    }
    
    func run(_ tree: TreeNode?, nums: inout [Int]) {
        guard let tree = tree else { return }
        
        nums.append(tree.val)
        run(tree.left, nums: &nums)
        run(tree.right, nums: &nums)
    }
}

//Let’s say a binary tree is "super balanced" if the difference between the depths of any two leaf nodes is at most one. Write a function to check if a binary tree is "super balanced".

function checkIfSuperBalanced(tree) {
    let minDepth = Infinity;
    let maxDepth = 0;
    
    function findMinMaxDepth(node, depth) {
        // Short circuit at this point, no point going further
        if (maxDepth - minDepth > 1) {
            return;
        }
        
        if (node.left) {
            findMinMaxDepth(node.left, depth + 1);
        }
        
        if (node.right) {
            findMinMaxDepth(node.right, depth + 1);
        }
        
        if (!node.left && !node.right) {
            // Will keep incrementing as you go further down the tree
            if (depth > maxDepth) {
                maxDepth = depth;
            }
            
            // Will only happen once
            if (depth < minDepth) {
                minDepth = depth;
            }
        }
    }
}
