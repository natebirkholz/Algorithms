import Foundation

fileprivate struct Element<Key: Hashable, Value: Equatable> {
    let key: Key
    let value: Value
}

public class HashTable<Key: Hashable, Value: Equatable> {
    fileprivate typealias Bucket = [Element<Key, Value>]
    fileprivate var buckets: [Bucket]
    let size: Int

    public init(size: Int) {
        self.size = size
        buckets = [Bucket]()
        for _ in 1...size {
            buckets.append(Bucket())
        }
    }

    public func add(key: Key, value: Value) {
        let hash = key.hashValue
        let index = abs(hash) % size

        buckets[index].append(Element(key: key, value: value))
    }

    public func find(key: Key) -> (Value)? {
        let index = self.index(forKey: key)

        for element in buckets[index] {
            if element.key == key {
                return (element.value)
            }
        }

        return nil
    }

    func index(forKey: Key) -> Int {
        let hash = forKey.hashValue
        return abs(hash) % size
    }
}
