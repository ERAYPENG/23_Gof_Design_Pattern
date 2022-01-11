import UIKit

struct TargetObject {
    var title: String?
    func printTitle() {
        if let title = title {
            print(title)
        } else {
            print("no hashValue")
        }
    }
}
class Cache { // 會存在重複的 object創建
    var targetObjects = [String: TargetObject]()
    func lookup(key: String) -> TargetObject {
        guard let object = targetObjects[key] else { return TargetObject() }
        return object
    }
}
let c = Cache()
c.targetObjects["Test"] = TargetObject(title: "Test")
c.lookup(key: "123").printTitle() // no hashValue
c.lookup(key: "Test").printTitle() // Test
