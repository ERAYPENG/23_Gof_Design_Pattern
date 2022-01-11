import UIKit

protocol ChainObjects {
    var next: ChainObjects? { get }
    func goNext()
}

class ViewA: ChainObjects {
    var next: ChainObjects? = ViewB()
    func goNext() {
        next?.goNext()
    }
}

class ViewB: ChainObjects {
    var next: ChainObjects? = ViewC()
    func goNext() {
        next?.goNext()
    }
}
class ViewC: ChainObjects {
    var next: ChainObjects? = nil
    func goNext() {
        print("C")
    }
}
let a = ViewA()
a.goNext() // OUTPUT: C