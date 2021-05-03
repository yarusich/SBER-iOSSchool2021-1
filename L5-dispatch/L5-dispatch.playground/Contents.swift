import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//MARK: Реализовать все возможные виды Method dispatch


//MARK: Direct
struct Cow {
    func voice() {
        print("muuuuuu")
    }
}

var cow = Cow()
cow.voice()


//MARK: Witness Table
protocol Watchable {
    func watch()
}

struct Dog: Watchable {
    func watch() {
        print("Watch dog")
    }
}

let watchDog: Watchable = Dog()
watchDog.watch()


//MARK: Virtual Table
class Orks {
    func action() {
        print("They will make Mordor great again!")
    }
}

class Urukhai: Orks {
    override func action() {
        print("They're taking the hobbits to Isengard!")
    }
}

let urukhai = Urukhai()
urukhai.action()


//MARK: Message Dispatch
class Horse: NSObject {
    @objc dynamic func run() {
        print("Running horse")
    }
}

class Foal: Horse {
    @objc override dynamic func run() {
        print("Running foal")
    }
}

let brownFoal = Foal()
brownFoal.run()
