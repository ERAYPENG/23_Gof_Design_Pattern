import UIKit

protocol Switchable {
    func turnOn(_ on: Bool)
}

class Equipment { // the bridge
    let obj: Switchable
    func turnOn(_ on: Bool) {
        obj.turnOn(on)
    }
    init(_ obj: Switchable) {
        self.obj = obj
    }
}

class Light: Switchable {
    func turnOn(_ on: Bool) {
        if on {
            print("light is on")
        } else {
            print("light is off")
        }
    }
}
class Television: Switchable {
    func turnOn(_ on: Bool) {
        if on {
            print("television is on")
        } else {
            print("television is off")
        }
    }
}
let light = Equipment(Light())
light.turnOn(true)
let television = Equipment(Television())
television.turnOn(false)