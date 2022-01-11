import UIKit

protocol Expression {
    func evaluate(_ context: String) -> Int
}

struct MyAdditionExpression: Expression { // 給不同語言加上各自的解釋器
    func evaluate(_ context: String) -> Int {
        return context.components(separatedBy: "加")
            .compactMap { Int($0) }
            .reduce(0, +)
    }
}

let c = MyAdditionExpression()
c.evaluate("1加1") // OUTPUT: 2
