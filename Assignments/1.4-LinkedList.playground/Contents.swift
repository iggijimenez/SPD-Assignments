import UIKit
import Foundation

//This is a generic, A generic is a function what can take any type
public class LLNode<T> {
    var value: T
    var next: LLNode?
    var previous: LLNode?
    
    public init(value: T) {
        self.value = value
    }
}


public class LinkedList<T> {
    public typealias Node = LLNode<T>
    
    private var head: Node?
    public var first: Node? {
        return head
    }
    
    
    public var last: Node? { //Time 12:30
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    
    public var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var print: String {
        var stringArray = "["
        guard var node = head else { return "[]" }
        
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        
        return stringArray + "]"
    }
    
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            //at least one node in list
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            // no nodes in list
            head = newNode
        }
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1 ..< index {
                node = node?.next
                if node  == nil { break }
            }
            return node!
        }
        
    }
    
    public func insert(value: T, atIndex index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            //sets the new nodes as the head
            newNode.next = head
            // changes the head to the previous pointer
            head?.previous = newNode
            //changes the head to the new node
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
}


let list = LinkedList<String>()
list.append(value: "A")
list.append(value: "B")
list.append(value: "C")
list.append(value: "D")
list.append(value: "E")
list.print


// Given a singly-linked list, rearrange the nodes by interleaving the first half of the linked list with the second half.

func reverseList(_ head: LinkedList<Any>?) -> LinkedList<Any>? {

    var prevNode: LinkedList<Any>? = nil // Mark 1
    var headNode = head // Mark 1

    while(headNode != nil) { // Mark 2
        let nextHead = headNode?.next // Mark 3
        headNode?.next = prevNode // Mark 4
        prevNode = headNode // Mark 5
        headNode = nextHead // Mark 6
    }

    return prevNode //Mark 7
}


//Rotate a given singly-linked list counter-clockwise by k nodes, where k is a given integer.






//struct hello{
//    var bole: Bool
//}
//let list = LinkedList<hello>()
