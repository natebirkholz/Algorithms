import Foundation

public class BinarySearchTree<T> where T: Comparable {
    let value: T
    var parent: BinarySearchTree<T>?
    var leftChild: BinarySearchTree<T>?
    var rightChild: BinarySearchTree<T>?

    public init(value: T) {
        self.value = value
    }

    private var leastChild: BinarySearchTree {
        if let left = leftChild {
            return left.leastChild
        } else {
            return self
        }
    }

    private var greatestChild: BinarySearchTree {
        if let right = rightChild {
            return right.greatestChild
        } else {
            return self
        }
    }

    public func add(value: T) {
        if value < self.value {
            if let left = leftChild {
                left.add(value: value)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = self
            }
        } else {
            if let right = rightChild {
                right.add(value: value)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = self
            }
        }
    }

    public func find(value: T) -> BinarySearchTree? {
        if self.value == value {
            return self
        } else if value < self.value {
            return leftChild?.find(value: value)
        } else {
            return rightChild?.find(value: value)
        }
    }

    public func remove(value: T) -> BinarySearchTree? {
        guard let node = find(value: value) else {
            return nil
        }

        return node.remove()

    }

    private func remove() -> BinarySearchTree? {
        var replacement: BinarySearchTree?
        if let left = self.leftChild  {
            replacement = left.greatestChild
        } else if let right =  self.rightChild {
            replacement = right.leastChild
        } else {
            replacement = nil
        }

        replacement?.remove()

        replacement?.rightChild = self.rightChild
        replacement?.leftChild = self.leftChild
        leftChild?.parent = replacement
        rightChild?.parent = replacement

        if let parent = self.parent {
            if parent.leftChild === self {
                parent.leftChild = replacement
            } else {
                parent.rightChild = replacement
            }

            replacement?.parent = parent
        }

        if let parent = self.parent {
            self.parent = nil
            self.leftChild = nil
            self.rightChild = nil

            return replacement
        } else {
            return self
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var desc = ""

        if let left = leftChild {
            desc += left.description
        }

        desc += "\(self.value), "

        if let right = self.rightChild {
            desc += right.description
        }

        return desc
    }
}
