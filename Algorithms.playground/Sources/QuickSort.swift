import Foundation

extension Array where Element: Comparable {
    public func quicksorted() -> [Element] {
        return qs(self)
    }

    private func qs(_ a: [Element]) -> [Element] {
        guard a.count > 1 else {return a}
        let pivot = a[a.count / 2]

        let less = a.filter({ $0 < pivot })
        let equal = a.filter({ $0 == pivot })
        let greater = a.filter({ $0 > pivot })

        return qs(less) + equal + qs(greater)
    }
}
