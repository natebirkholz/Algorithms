import Foundation

extension Array where Element: Comparable {
    public func binarySearch(_ value: Element) -> Element? {
        return binarySearch(val: value, lowerBound: 0, upperBound: count-1)
    }

    private func binarySearch(val: Element, lowerBound: Int, upperBound: Int) -> Element? {
        let medianIndex = Int(floor(Double((upperBound - lowerBound) / 2))) + lowerBound
        let medianValue = self[medianIndex]

        if medianValue == val {
            return medianValue
        } else if (upperBound - lowerBound) < 2 {
            return nil
        } else if val < medianValue {
            return binarySearch(val: val, lowerBound: lowerBound, upperBound: medianIndex)
        } else {
            return binarySearch(val: val, lowerBound: medianIndex+1, upperBound: upperBound)
        }
    }
}
