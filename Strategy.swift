import UIKit
// 目的為建立穩定的繼承，把變化的幾種情況封裝好，然後把自己變化的部分隔離成(interface/protocol)，讓子類繼承
protocol WeaponBehavior {
    func use()
}
class SwordBehavior: WeaponBehavior {
    func use() { print("sword") }
}
class BowBehavior: WeaponBehavior {
    func use() { print("bow") }
}
class Character {
    var weapon: WeaponBehavior?
    func attack() {  weapon?.use() }
}
class Knight: Character {
    override init() {
        super.init()
        weapon = SwordBehavior()
    }
}
class Archer: Character {
    override init() {
        super.init()
        weapon = BowBehavior()
    }
}

Knight().attack() // output: sword
Archer().attack() // output: bow
