import UIKit

protocol Subject {
    mutating func operation()
}
struct SecretObject: Subject {
    func operation() {
        // real implementation
    }
}
struct PublicObject: Subject { // 控制對 SecretObject的訪問
    private lazy var s = SecretObject()
    mutating func operation() {
        s.operation()
    }
}
var p = PublicObject()
p.operation()
