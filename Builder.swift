import UIKit

struct Builder {
    var partA: String
    var partB: String
}
struct Product {
    var partA: String
    var partB: String
    init(_ builder: Builder) {
        partA = builder.partA
        partB = builder.partB
    }
}

let builder = Builder(partA: "A", partB: "B") // we can use multiple builders to make product
let product = Product(builder)