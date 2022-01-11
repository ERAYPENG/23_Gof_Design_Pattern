import UIKit
// 與 observer不同， observer是不接收接受方的廣播， Mediator是兩個（或多個）對象之間的廣播互相傳遞
protocol Receiver {
    func receive(_ message: String)
}

protocol Mediator {
    func notify(message: String)
    func addReceiver(_ receiver: [Receiver])
}

class ConcreteMediator: Mediator {
    var receiverArray = [Receiver]()
    func notify(message: String) {
        receiverArray.forEach({ $0.receive(message)})
    }
    
    func addReceiver(_ receiver: [Receiver]) {
        receiverArray.append(contentsOf: receiver)
    }
}

protocol Component: Receiver {
    var mediator: Mediator { get }
}

struct ConcreteComponent: Component {
    var mediator: Mediator
    var name: String
    
    func receive(_ message: String) {
        print(name + " receive: " + message)
    }
}

var mediator = ConcreteMediator()
let components: [ConcreteComponent] = {
    let c1 = ConcreteComponent(mediator: mediator, name: "C1")
    let c2 = ConcreteComponent(mediator: mediator, name: "C2")
    let c3 = ConcreteComponent(mediator: mediator, name: "C3")
    return [c1, c2, c3]
}()
mediator.addReceiver(components)
mediator.notify(message: "hi")