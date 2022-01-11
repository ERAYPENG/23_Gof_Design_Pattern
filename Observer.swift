import UIKit
// 定義對象間的一種一對多的依賴關係，當一個對象的狀態發生改變時，通知所有依賴於它的對象
protocol Observable {
    var observers: [Observer] { get }
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifyObservers()
}
class ConcreteObservable: Observable {
    var observers = [Observer]()
    func add(observer: Observer) {
        observers.append(observer)
    }
    func remove(observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    func notifyObservers() {
        observers.forEach { $0.update() }
    }
}
protocol Observer: class {
    func update()
}
class ConcreteObserverA: Observer {
    func update() { print("A") }
}
class ConcreteObserverB: Observer {
    func update() { print("B") }
}

let observable = ConcreteObservable()
let a = ConcreteObserverA()
let b = ConcreteObserverB()
observable.add(observer: a)
observable.add(observer: b)
observable.notifyObservers() // output: A B
observable.remove(observer: b)
observable.notifyObservers() // output: A
