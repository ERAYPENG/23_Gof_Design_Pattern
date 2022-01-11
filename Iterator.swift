import UIKit

protocol Iterator { // 能用hasNext和Next對集合來逐一 mapping
    func hasNext() -> Bool
    func next() -> Int?
}
class ConcreteIterator: Iterator {
    private var currentIndex = 0
    var elements = [Int]()
    func next() -> Int? {
        defer { currentIndex += 1 }
        if currentIndex < elements.count {
            return elements[currentIndex]
        } else {
            currentIndex = 0
            return nil
        }
    }
    func hasNext() -> Bool {
        return currentIndex < elements.count
    }
}
protocol AbstractCollection {
    func makeIterator() -> Iterator
}
class ConcreteCollection: AbstractCollection {
    let iterator = ConcreteIterator()
    func add(_ e: Int) {
        iterator.elements.append(e)
    }
    func makeIterator() -> Iterator {
        return iterator
    }
}
let c = ConcreteCollection()
c.add(1)
c.add(2)
c.add(3)
let iterator = c.makeIterator()
while iterator.hasNext() {
    if let next = iterator.next() {
        print(next)
    }
}
