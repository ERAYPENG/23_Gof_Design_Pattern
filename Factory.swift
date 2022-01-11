import UIKit

protocol Product {}
class ProductA: Product {}
class ProductB: Product {}

class Client {
    let factory = Factory()
}

class Factory {
    func createProduct() -> Product? { return nil } // 用於繼承
    let factoryA = ConcreteFactoryA()
    let factoryB = ConcreteFactoryB()
    func createProduct(type: Int) -> Product? { // 用於調用
        if type == 0 {
            return factoryA.createProduct()
        } else {
            return factoryB.createProduct()
        }
    }
}

class ConcreteFactoryA: Factory {
    let productA = ProductA()
    override func createProduct() -> Product? { return productA }
}

class ConcreteFactoryB: Factory {
    let productB = ProductB()
    override func createProduct() -> Product? { return productB }
}

let client = Client()
client.factory.createProduct(type: 0) // get ProductA

