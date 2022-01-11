import UIKit

class Singleton {
    static let sharedInstance = Singleton()
    private init() {} // make sure only have one instance
    static func sharedInstanceMethod() -> Singleton {
        return Singleton()
    }
}
let singleton = Singleton.sharedInstance