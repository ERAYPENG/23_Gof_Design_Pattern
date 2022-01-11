import UIKit

protocol Facade {
    func combineMethod()
}
class LegacyCode {
    func methodA() { }
    func methodB() { }
}
extension LegacyCode: Facade { // 在不改變其內在的情況下，包裝一層易於調用的表層(通常是API)
    func combineMethod() {
        methodA()
        methodB()
    }
}
class Client {
    let f: Facade = LegacyCode()
}
let c = Client()
c.f.combineMethod()
