import Foundation


public class MergeSorter {
    public static func mergeSorted(array: [Int]) -> [Int] {
        guard array.count > 1 else {return array}
        let median = array.count / 2

        let left = MergeSorter.mergeSorted(array: Array(array[0..<median]))
        let right = MergeSorter.mergeSorted(array: Array(array[median..<array.count]))

        let sorted = MergeSorter.merge(left: left, right: right)
        return sorted
    }

    private static func merge(left: [Int], right: [Int]) -> [Int] {
        var li = 0
        var ri = 0
        var sorted = [Int]()

        while li < left.count && ri < right.count {
            if left[li] < right[ri] {
                sorted.append(left[li])
                li += 1
            } else if right[ri] < left[li] {
                sorted.append(right[ri])
                ri += 1
            } else {
                sorted.append(left[li])
                sorted.append(right[ri])
                li += 1
                ri += 1
            }
        }

        while li < left.count {
            sorted.append(left[li])
            li += 1
        }

        while ri < right.count {
            sorted.append(right[ri])
            ri += 1
        }
        
        return sorted
    }
}

