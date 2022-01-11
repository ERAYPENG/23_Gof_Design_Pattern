import UIKit

protocol Visitor { // 主要將數據結構與數據操作分離
    func visit(_ c: ComponentA)
    func visit(_ c: ComponentB)
}
struct ConcreteVisitor: Visitor {
    func visit(_ c: ComponentA) {
        c.featureA()
    }
    func visit(_ c: ComponentB) {
        c.featureB()
    }
}
protocol Component {
    func accept(_ v: Visitor)
}
struct ComponentA: Component {
    func featureA() {
        print("Feature A")
    }
    func accept(_ v: Visitor) {
        v.visit(self)
    }
}
struct ComponentB: Component {
    func featureB() {
        print("Feature B")
    }
    func accept(_ v: Visitor) {
        v.visit(self)
    }
}
let components: [Component] = [ComponentA(), ComponentB()]
components.forEach { $0.accept(ConcreteVisitor()) }
