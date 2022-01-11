import UIKit

protocol Target {
    var value: String { get }
}
struct Adapter: Target {
    let adaptee: Adaptee
    var value: String {
        return "\(adaptee.value)"
    }
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
}
struct Adaptee {
    var value: Int
}
Adapter(Adaptee(value: 1)).value // use adapter to turn int into string