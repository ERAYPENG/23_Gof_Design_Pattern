import UIKit
// 存在在抽象類中的方法聲明，由子類具體實現。這樣這套方法產生了一套模具不同產品的派生效果，但Swift/Objective-C都沒有抽象類
// class Soldier {
//     func attack() {} // <-- Template Method
//     private init() {} // <-- avoid creation
// }
// class Paladin: Soldier {
//     override func attack() {
//         print("hammer")
//     }
// }
// class Archer: Soldier {
//     override func attack() {
//         print("bow")
//     }
// }