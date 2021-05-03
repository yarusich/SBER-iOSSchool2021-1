import UIKit

// MARK: Реализовать COW в своей структуре со свойством reference type (isKnownUniquelyReferenced)


// MARK: Структура с реализацией copy-on-write
struct Car {
    var color: String
    
// MARK: Делаем приватным, чтобы изменять свойство только через automakerName
    private(set) var automaker: Automaker
    var automakerName: String {
        get { automaker.name }
        set {
            if !isKnownUniquelyReferenced(&automaker) {
                automaker = Automaker(name: newValue)
                return
            } else {
                automaker.name = newValue
            }
            
        }
    }
    
    init(automaker: Automaker, color: String) {
        self.automaker = automaker
        self.color = color
    }
}

// MARK: Автопроизводитель, reference type
class Automaker {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// MARK: Создаём автопроизводителя
var mazda = Automaker(name: "Mazda")
// MARK: Создаём 1-ю машину
var firstCar = Car(automaker: mazda, color: "red")
// MARK: Создаём 2-ю машину, копированием 1-й
var secondCar = firstCar

print(firstCar.automaker.name, firstCar.color)
print(secondCar.automaker.name, secondCar.color)
print("---------")

// MARK: Меняем автопроизводителя и цвет у 1-й машины
firstCar.automakerName = "Audi"
firstCar.color = "blue"

print(firstCar.automaker.name, firstCar.color)
print(secondCar.automaker.name, secondCar.color)
print("---------")
