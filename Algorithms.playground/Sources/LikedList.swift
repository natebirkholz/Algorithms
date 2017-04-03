import Foundation

fileprivate class LLNode<T> where T: Equatable {
    var value: T?
    var next: LLNode?

    init(_ value: T) {
        self.value = value
    }
}

public class LinkedList<T> where T: Equatable {
    fileprivate typealias Node = LLNode<T>

    fileprivate var root: Node?

    public init() {}

    public func append(_ value: T) {
        if self.root == nil {
            self.root = Node(value)
            return
        }

        var node = self.root

        while node?.next != nil {
            node = node?.next
        }

        node?.next = Node(value)
    }

    public func find(value: T) -> T? {
        guard root != nil else { return nil }
        var node = root
        while let next = node?.next, node?.value != value {
            node = next
        }

        if let val = node?.value, val == value { return val } else { return nil }
    }

    public func push(_ value: T) {
        let newNode = Node(value)

        newNode.next = root

        self.root = newNode
    }

    public func pop() -> T? {
        if let nodeToReturn = self.root {
            self.root = self.root?.next
            return nodeToReturn.value
        } else {
            return nil
        }
    }

    public func removeLast() -> T? {
        if self.root == nil {
            return nil
        }

        if self.root?.next == nil {
            if let nodeToReturn = self.root {
                self.root = nil
                return nodeToReturn.value
            }
        }

        var node = self.root
        var lastNode: Node? = nil
        while node?.next != nil {
            lastNode = node
            node = node?.next
        }

        if let nodeToReturn = node {
            lastNode?.next = nil
            return nodeToReturn.value
        } else {
            return nil
        }
    }

    public func remove(value: T) -> T? {
        guard root != nil else { return nil }
        var node = root
        var last: Node? = nil
        while let next = node?.next, node?.value != value {
            last = node
            node = next
        }

        if let val = node?.value, val == value {
            last?.next = node?.next
            node?.next = nil
            node?.value = nil
            return val
        } else {
            return nil
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var desc = "[ "

        if self.root == nil {
            desc += " ]"
            return desc
        }

        var node = self.root
        while let next = node?.next, let val = node?.value {
            desc += "\(val), "
            node = next
        }

        if let val = node?.value {
            desc += "\(val) ]"
        } else {
            desc += " ]"
        }

        return desc
    }
}
