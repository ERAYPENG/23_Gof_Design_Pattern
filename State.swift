import UIKit
// 可從內部改變其值，並同時改變其行為
protocol State {
    func operation()
}
class ConcreteStateA: State {
    func operation() {
        print("A")
    }
}
class ConcreteStateB: State {
    func operation() {
        print("B")
    }
}
class Context {
    var state: State = ConcreteStateA()
    func someMethod() {
        state.operation()
    }
}
let c = Context()
c.someMethod() // OUTPUT: A
c.state = ConcreteStateB() // switch state
c.someMethod() // OUTPUT: B
