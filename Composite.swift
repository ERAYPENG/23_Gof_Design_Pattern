import UIKit

protocol Component {
    func someMethod()
}
class Leaf: Component {
    func someMethod() {
        // Leaf
    }
}
class Composite: Component {
    var components = [Component]()
    func someMethod() {
        // Composite
    }
}
let leaf = Leaf()
let composite = Composite()
composite.components += [leaf]
composite.someMethod()
leaf.someMethod()