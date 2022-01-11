import UIKit

protocol Command {
    var operation: () -> Void { get }
    var backup: String { get }
    func undo()
}

struct ConcreteCommand: Command {
    var backup: String
    var operation: () -> Void
    func undo() {
        print(backup)
    }
}

struct Invoker { // 可將邏輯實體化
    var command: Command
    func execute() {
        command.operation()
    }
    func undo() { // 一定要支持 undo
        command.undo()
    }
}

let printA = ConcreteCommand(backup: "Default A") {
    print("A")
}
let invoke = Invoker(command: printA)
invoke.execute() // OUTPUT: A
invoke.undo() // OUTPUT: Default A