//: Playground - noun: a place where people can play

import UIKit

var greeting : String
let constGreeting : String

constGreeting = "Bonjour";
//constGreeting = "Bonjour"

//var copyOfGreeting = greeting

var str : String = "Hello, playground"
var constStr = "Hello, playground"

str = "Goodbye, playground"; constStr = "Goodbye"

greeting = "Hello"

str = String(1)
var integerAsString : String = String(1)

str + integerAsString

// An optional string
var optionalString : String? = "I'm an optional string"

//optionalString = nil

var optionalLength = optionalString?.stringByRemovingPercentEncoding

//optionalString = nil

var forcedUnwrappedOptionalLength = optionalString!.characters.count

// This is guaranteed to work because it's not optional
str.characters.count

if let theString = optionalString {
    theString.characters.count
}

switch str {
case is String:
    print("It is a string")
case "Hello":
    print("The string is hello")
default:
    print("The string is something else")
}

if 1 == 1 {
    print("The universe makes sense")
} else if 1 == 2 {
    print("It's all gone wrong")
} else {
    print("I don't know what's happening anymore")
}

for i in 1..<10 {
    print(i)
}

var count = 0

while count < 10 {
    count += 1
}

repeat {
    count += 1
    
    if count == 17 {
        continue
    }
    
    print("Count is " + String(count))
} while count < 20

xLoop: for x in 1...4 {
    for y in 1...4 {
        if x == 2 && y == 2 {
            break xLoop
        }
        print("\(x)-\(y)")
    }
}

var arrayOfStrings : [String] = ["Hi", "There", "How", "Are", "You"]

arrayOfStrings[0]

arrayOfStrings.append("Today")

for word in arrayOfStrings {
    print("The word is \(word)")
}

var translations = ["Hello":"Bonjour", "Goodbye": "Au revoir"]

var myWord = translations["Hello"]

var tuple = (numberOfCats: 1, numberOfDogs: 2)

tuple.0
tuple.1

tuple.numberOfDogs
tuple.numberOfCats

tuple.0 = 5

let setOfNumbers : Set<Int> = [1,2,3,3,4,4,5]

setOfNumbers.contains(2)

for item in setOfNumbers {
    print("item: \(item)")
}


let number = 5

switch number {
case 0:
    print("It's 0")
    
case 1:
    print("It's 1")
    fallthrough
default:
    break
}

//enum Drink : String {
//    case Coffee
//    case Tea
//    case SoftDrink
//}

enum Drink {
    case Coffee(milk : Bool, sugars : Int)
    case Tea
    case SoftDrink(brand : String)
}

var myBeverage = Drink.Coffee(milk: true, sugars: 0)

myBeverage = .Tea

switch myBeverage {
case .Coffee(true, let sugars):
    print("It's coffee with milk and \(sugars) sugars")
case .Tea:
    print("It's tea")
default:
    break
}

//myBeverage.rawValue

//myBeverage = Drink(rawValue: "Tea") ?? .Coffee

//myBeverage = Drink(rawValue: 2) ?? .Coffee

//if Drink.Coffee == Drink.Tea {
//    print("nope")
//}
//
//if myBeverage == Drink.Coffee {
//    
//}
//
//switch myBeverage {
//case .Coffee:
//    print("It's \(myBeverage)")
//case .Tea:
//    print("It's tea")
//case .SoftDrink:
//    print("It's soft drink")
//    
//}

func sayHello() {
    print("Hello")
}

sayHello()

func addTwo(number : Int) -> Int {
    return number + 2
}

addTwo(4)

func addNumber(number1 : Int, _ number2 : Int) -> Int {
    return number1 + number2
}

addNumber(1, 2)

// _ = "i don't care"
for _ in 1...5 {
    print("Hi there")
}

// Not allowed
// addNumbers(number2 = 2, number1 = 1)


//var addNumberFunction = addNumber
//
func multiplyNumbers(num1 : Int, _ num2 : Int) ->  Int {
    return num1 * num2
}
//
//addNumberFunction = multiplyNumbers

func doSomethingWithNumbers(num1 : Int, _ num2 : Int, thingToDo: (Int,Int)->Int ) -> Int {
    
    return thingToDo(num1, num2)
    
}

doSomethingWithNumbers(2, 5, thingToDo: multiplyNumbers)

doSomethingWithNumbers(4, 3, thingToDo: {
    $0 + $1 + 1
})

func makeAdder(num : Int) -> (Int) -> Int {
    func theAdder(numberToAdd : Int) -> Int {
        return numberToAdd + num
    }
    
    return theAdder
}

let addOne = makeAdder(1)

addOne(5)

addOne(6)

let numbers = [1,2,4,8]

var numbersTimesTwo : [Int] = []

for num in numbers {
    numbersTimesTwo.append(num * 2)
}

// better:

numbersTimesTwo = numbers.map({ $0 * 2 })

numbersTimesTwo

var numbersAsStrings = numbers.map({ String($0) })

numbersAsStrings

let sum = numbers.reduce(0, combine: { return $0 + $1})
sum

let digits = numbers.reduce("", combine: { return $0 + String($1)})
digits

// Alternate syntax
//numbers.reduce(0) { (<#T#>, <#Int#>) -> T in
//    <#code#>
//}

translations.map { (entry: (String,String)) -> String  in
    return entry.0 + entry.1
}


numbers.filter {
    $0 % 4 == 0
}

// These three functions are all semantically identical
numbers.sort({ (a, b) -> Bool in
    return a > b
})

numbers.sort { (a, b) -> Bool in
    return a > b
}

numbers.sort() { (a, b) -> Bool in
    return a > b
}

class Vehicle {
    var numberOfWheels = 4 {
        willSet {
            print("Number of wheels will change from \(numberOfWheels) to \(newValue)")
        }
        didSet {
            print("Number of wheels changed from \(oldValue) to \(numberOfWheels)")
        }
    }
    
    func drive() {
        print("Driving on \(numberOfWheels) wheels!")
    }
}

var myCar = Vehicle()

myCar.numberOfWheels
myCar.numberOfWheels = 3

myCar.drive()

class Car : Vehicle {
    private var engineSize : Double
    
    lazy var someExpensiveProperty : Int = {
        return 4
    }()
    
    var engineSizePerWheel : Double {
        set {
            self.engineSize = Double(numberOfWheels) * newValue
        }
        get {
            return engineSize / Double(numberOfWheels)
        }
    }
    
    var wheelsPerEngineSize : Int {
        return Int(Double(numberOfWheels) / engineSize)
    }
    
    override convenience init() {
        self.init(engineSize: 3)
    }
    
    init(engineSize : Double) {
        self.engineSize = engineSize
    }
    
    deinit {
        print("Car is going away!")
    }
}

let myOtherCar = Car()
myOtherCar.engineSize
myOtherCar.engineSizePerWheel
myOtherCar.engineSizePerWheel = 1
myOtherCar.engineSize
myOtherCar.wheelsPerEngineSize

myOtherCar.someExpensiveProperty

var myOptionalCar : Car? = Car()

weak var myWeakReferenceToCar = myOptionalCar
myWeakReferenceToCar?.drive()

myOptionalCar = nil

myWeakReferenceToCar

do {
    try String(contentsOfFile: "myFile.txt")
} catch let error {
    print("There was an error: \(error)")
}

try? String(contentsOfFile: "myFile.txt")



