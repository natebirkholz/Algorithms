import Foundation

fileprivate struct Bucket {
    var values = [Int]()
    var count = 0

    mutating func add(value: Int) {
        values.append(value)
        count += 1
    }

    mutating func sort() {
        var sorted = values
        for i in 0..<count {
            var j = i

            while j > 0 && sorted[j] < sorted[j-1] {
                let swap = sorted[j-1]
                sorted[j-1] = sorted[j]
                sorted[j] = swap

                j -= 1
            }
        }

        values = sorted
    }
}

public class BucketSorter {
    private var buckets = [Bucket]()
    private let numberOfBuckets: Int
    private let maxValue: Int
    private var divisor: Int {
        return maxValue / numberOfBuckets
    }

    public init(numberOfBuckets: Int, maxValue: Int) {
        self.numberOfBuckets = numberOfBuckets
        self.maxValue = maxValue

        for _ in 0..<numberOfBuckets {
            buckets.append(Bucket())
        }
    }

    public func bucketSort(array: [Int]) -> [Int] {
        for value in array {
            guard value <= maxValue else { continue }
            guard value < maxValue else {
                buckets[numberOfBuckets-1].add(value: value)
                continue
            }

            let index = value / divisor
            buckets[index].add(value: value)
        }
        var sorted = [Int]()
        for i in 0..<numberOfBuckets {
            buckets[i].sort()
            sorted += buckets[i].values
        }
        
        return sorted
    }
}
