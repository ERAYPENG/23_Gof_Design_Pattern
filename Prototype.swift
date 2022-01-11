import UIKit

protocol Prototype {
    func clone() -> Prototype
}
struct Product: Prototype {
    var title: String
    func clone() -> Prototype {
        return Product(title: title)
    }
}
let product = Product(title: "prototype")
if let clone = product.clone() as? Product {
    print(clone.title)
}