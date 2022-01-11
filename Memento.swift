import UIKit
// 這個 pattern有兩個角色，一個是要存儲的 class本身(Memento)和執行存儲操作的 class(Caretaker)
typealias Memento = [String: Int]
protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}
class GameState: MementoConvertible {
    var memento: Memento {
        return [chapter: level]
    }
    var chapter: String
    var level: Int
    required init?(memento: Memento) {
        self.chapter = memento.keys.first ?? ""
        self.level = memento.values.first ?? 0
    }
    init(chapter: String, level: Int) {
        self.chapter = chapter
        self.level = level
    }
    func latestState(chapter: String, level: Int) {
        self.chapter = chapter
        self.level = level
    }
}
protocol CaretakerConvertible {
    static func save(memonto: Memento, for key: String)
    static func loadMemonto(for key: String) -> Memento?
}
class Caretaker: CaretakerConvertible {
    static func save(memonto: Memento, for key: String) {
        let defaults = UserDefaults.standard
        defaults.set(memonto, forKey: key)
        defaults.synchronize()
    }
    static func loadMemonto(for key: String) -> Memento? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key) as? Memento
    }
}
let g = GameState(chapter: "Prologue", level: 0)
g.latestState(chapter: "second", level: 20)

Caretaker.save(memonto: g.memento, for: "gamename")
// load
let gameState = Caretaker.loadMemonto(for: "gamename") // ["Second": 20]
