import UIKit

protocol Component {
    var cost: Int { get }
}

protocol Decorator: Component {
    var component: Component { get }
    init(_ component: Component)
}

struct Coffee: Component { // 被裝飾的對象，不再能裝飾別人，所以繼承 Component
    var cost: Int
}

struct Sugar: Decorator {
    var component: Component
    var cost: Int {
        return self.component.cost + 1
    }
    
    init(_ component: Component) {
        self.component = component
    }
    
}

struct Milk: Decorator {
    var component: Component
    var cost: Int {
        return self.component.cost + 2
    }
    
    init(_ component: Component) {
        self.component = component
    }
}

Milk(Sugar(Coffee(cost: 19))).cost
