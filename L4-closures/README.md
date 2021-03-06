Описать различие objective-c блоков от Swift closure

Главное отличие - в замыканиях переменные изменяются, а в блоках копируются.
При этом, если отметить переменную в блоке атрибутом _block, она станет изменяемой, как и в замыканиях.

Блоки Swift closures и Objective-C совместимы, поэтому вы можете передать методы Swift closures в Objective-C, которые ожидают блоки. Swift closures и функции имеют один и тот же тип, поэтому мы даже можем передать имя функции Swift. 

Существует три вида блоков:
1. Global blocks - блоки без состояния, не захватывающие никакого состояния (переменных). Располагаются в глобальной памяти (не в стеке, не в куче). Методы copy, retain, release и autorelease глобального блока ничего не делают.
2. Stack blocks - локальные блоки, которые захватывает внешние переменные и размещается в стеке. Метод retain ничего не делает для стекового блока.
3. Malloc blocks - блоки в куче. После копирования блока из стека в кучу, блок может использоваться за пределами области действия в которой он был определен. Так же, после копирования, блок становится объектом к которому применяется подсчет ссылок. При определении блока stackBlock, необходимо отправить ему сообщение copy, которое не подставил ARC. Метод copy в свою очередь работает как retain для NSObject.
