import UIKit

// MARK: - Задача 2
//Реализовать базовый протокол для контейнеров. Контейнеры должны отвечать, сколько они содержат элементов,
//добавлять новые элементы и возвращать элемент по индексу. На основе базового протокола реализовать универсальный
//связанный список и универсальную очередь (FIFO) в виде структуры или класса.

// Базовый протокол контейнера
protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    mutating func valueFromIndex(_ index: Int) -> Item?
}

// Элемент связанного списка
final class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// Связанный список
class LinkedList<T> {
    var firstNode: Node<T>?
}

extension LinkedList: Container {
    
// Количество элементов
    var count: Int {
        var counter = 0
        var node = firstNode
        
        if firstNode == nil {
            return 0
        } else {
            counter += 1
        }
        while node?.next != nil {
            counter += 1
            node = node?.next
        }
        return counter
    }
    
// Добавление нового элемента (в конец списка)
     func append(_ item: Node<T>) {

        if firstNode == nil {
            firstNode = item
        } else {
            var node = firstNode
            while node?.next != nil {
                node = node?.next
            }
            node?.next = item
        }
    }

// Получение элемента по его индексу
     func valueFromIndex(_ index: Int) -> Node<T>? {
        if index == 0 {
            return firstNode
        }
        var counter = 0
        var node = firstNode
        var returnNode: Node<T>?
        
        while node?.next != nil {
            counter += 1
            node = node?.next
            if counter == index {
                returnNode = node
            }
        }
        
        return returnNode
    }
}

// Проверка
var listTest = LinkedList<Int>()
listTest.append(Node(value: 3))
listTest.append(Node(value: 1))
listTest.append(Node(value: 2))
print("Количество элементов в списке: \(listTest.count)")
print("Значение элемента под индексом 1: \(listTest.valueFromIndex(0)?.value)")


// Очередь
struct Queue<T> {
    private var items = [T]()

    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeFirst()
    }
    
}

extension Queue: Container {
    var count: Int {
        items.count
    }
    
    mutating func append(_ item: T) {
        push(item)
    }
    
    mutating func valueFromIndex(_ index: Int) -> T? {
        items[index]
    }
}

// Проверка
var queueTest = Queue<Int>()
queueTest.append(1)
queueTest.append(2)
queueTest.append(3)
print("Количество элементов в очереди:: \(queueTest.count)")
print("Элемент очереди под индексом 2: \(queueTest.valueFromIndex(2))")



