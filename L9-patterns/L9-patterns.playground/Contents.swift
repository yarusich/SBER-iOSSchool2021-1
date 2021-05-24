import UIKit

//MARK: Abstract factory

protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("Вождение маленькой машины")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("Вождение машины среднего размера")
    }
}

protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("Вождение маленького автобуса")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("Вождение автобуса среднего размера")
    }
}

protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Маленький автобус создан")
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Маленькая машина создана")
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        print("Автобус среднего размера создан")
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Машина среднего размера создана")
        return MiddleSizeCar()
    }
}

let littleFactory = LittleSizeFactory()
littleFactory.produceCar()

let middleFactory = MiddleSizeFactory()
middleFactory.produceBus()



//MARK: Builder

//Протокол для тем
protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

//Протокол для строителя инициализирующий тему
protocol ThemeBuilderProtocol {
    func setBackground(color: UIColor)
    func setText(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

//Класс с реализацией протокола тем
class Theme: ThemeProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

//Строитель
class ThemeBuilder: ThemeBuilderProtocol {
    private var backgroundColor: UIColor?
    private var textColor: UIColor?
    
    func setBackground(color: UIColor) {
        backgroundColor = color
    }
    
    func setText(color: UIColor) {
        textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor else { return nil }
        guard let textColor = textColor else { return nil }
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
}

let builder = ThemeBuilder()
builder.setText(color: .black)
builder.setBackground(color: .red)
//Если один из параметров отсутствует - тема будет nil
let theme = builder.createTheme()
