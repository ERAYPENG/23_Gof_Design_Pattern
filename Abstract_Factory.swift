import UIKit

protocol ProductA {}
class ProductA1: ProductA {}
class ProductA2: ProductA {}
protocol ProductB {}
class ProductB1: ProductB {}
class ProductB2: ProductB {}

class Client {
    let factory = Factory()
}
class Factory {
    func createProductA() -> ProductA? { return nil } // 用於繼承
    func createProductB() -> ProductB? { return nil } // 用於繼承
    let factoryA = ConcreteFactoryA()
    let factoryB = ConcreteFactoryB()
    
    func createProductA(type: Int) -> ProductA? { // 用於調用
        if type == 0 {
            return factoryA.createProductA()
        } else {
            return factoryB.createProductA()
        }
    }
    func createProductB(type: Int) -> ProductB? { // 用於調用
        if type == 0 {
            return factoryA.createProductB()
        } else {
            return factoryB.createProductB()
        }
    }
}
class ConcreteFactoryA: Factory {
    override func createProductA() -> ProductA? { return ProductA1() }
    override func createProductB() -> ProductB? { return ProductB1() }
}
class ConcreteFactoryB: Factory {
    override func createProductA() -> ProductA? { return ProductA2() }
    override func createProductB() -> ProductB? { return ProductB2() }
}
let client = Client()
client.factory.createProductA(type: 0) // get ProductA1
client.factory.createProductA(type: 1) // get ProductA2
client.factory.createProductB(type: 0) // get ProductB1
client.factory.createProductB(type: 1) // get ProductB2