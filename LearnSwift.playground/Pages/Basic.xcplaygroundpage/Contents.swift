import UIKit

var greeting = "Hello, playground"

print("Welcome to swift")

/*:
#Welcome to Playgrounds
This is your *first* playground which is intended to demonstrate:
 *The use of **Quick Look**
 *Placing results in-line with the code
 */

var x = 10

for index in 1...20 {
    let y = index * x
    x -= 1
    print(y)
}

var userCount: Int = 10
var signalStrength = 2.231  /*The swift decide that's a Double type*/
let companyName = "My Company" /*The swift decide that's a String type*/

let myTuple2 = (10, 432.433, "This is a String")
let  myString = myTuple2.2
print(myString)

let myTuple1 = (count:10, length:432.433, message:"This is a String")
print(myTuple1.message)

var index: Int?

index = 3

var treeArray = ["Apple", "Banana", "Orange"]

//: if index != nil {
//:    print(treeArray[index!])
    
//:}else{
//:    print("index does not contain a value")
//:}

//: *string interpolation

var userName = "John"
var inboxCount = 25
let maxCount = 100

var message = "\(userName) has \(inboxCount) messages. Message capacity remaining is \(maxCount-inboxCount) messages"

var multiline = """
    
    The console glowed with flashing warnings.
    Clearly time was running out.
    
    "I thought you said you knew how to fly this!' Yelled Mary.
    
    "It was much easier on the simulator" replied her brother, trying to keep the panic out of his voice.
    
    """

print(message)
print(multiline)

//: Swift optional Type : ?, print(age!), if let
//: Unwrapping

var color_index: Int?

color_index = 2

var colorArray = ["Red", "Green", "Blue"]

if color_index == nil { //: if color_index != nil => Blue
    print(colorArray[color_index!] )
} else {
    print("index does not contain a value")
}

var pet1: String?
var pet2: String?

pet1 = "cat"
pet2 = "dog"

if let pet1, let pet2 {
    print(pet1)
    print(pet2)
}else {
    print("insufficient pets")
}

//: Type casting upcasting and downcasting as and as!
let record : NSDictionary = ["comment": "Hi"] //: Dictionary
let myValue = record.object(forKey: "comment") as! String

//:Take out the value of the key "comment" from the record dictionary, forcibly convert it to String and put it in myValue.

if (10 < 20) || (20 < 10) {
    print("Expression is true")
    
}

//: one-side range operator , x... , ...y, 2... , ...6
//: Bit arithmethic

let y = 3
let z = ~y
print("Result is \(z)")

//: looping control
var index2 = 1

for index2 in 1...5{
    print("Value of index is \(index2)")
}


var myCount = 0

while myCount < 100 {
    myCount += 1
}

// repeat while

//if else, else if

//: #Guard, unwrapping

func multiplyByTen(value: Int?){
    guard let number = value, number < 10 else {
        print("Number is too high")
        return
    }
    
    let result = number * 10
    print(result)
    
}

multiplyByTen(value: 5)
multiplyByTen(value: 10)


// switch case, fallthrough

let value = 4

switch (value) {
    case 1:
    print("Value is 1")
case 2:
    print("Value is 2")
default:
    print("Value is neither 1 nor 2")
}

let temperature = 83

switch (temperature) {
case 0...49:
    print("Cold")
case 50...89:
    print("Mild")
default:
    print("Hot")
}

//parameter, func

/*
 func buildMessageFor(name: String, count: Int)-> String {
 return("\(name),you are customer number \(count)") }
 */

func sayHello() {
    print("Hello")
}
sayHello()

// local parameter name
// external parameter name
// let message = buildMessageFor(count:100)

func sizeConverter(_ length: Float) -> (yards:Float, centimeters: Float, meters: Float){
    
    let yards = length * 0.027778
    let centimeters = length * 30.48
    let meters = length * 0.0328084
    
    return (yards, centimeters, meters)
    
}

let lengthTuple = sizeConverter(20)

print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)

//: #Closure, Closure Expression

let say2Hello = { print("Hello")}
say2Hello

let mutiply = {(_ val1: Int, _ val2: Int) -> Int in return val1 * val2}
let result = mutiply(10, 20)


//: #class , approaching with property and method .property, .method , protocol

class BankAccount {
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    
    init(number: Int, balance: Float){
        accountNumber = number
        accountBalance = balance
    }
    
    func displayBalance() {
        print("Your current balance is \(accountBalance)")
    }
    
    class func getMaxBalance() -> Float {
        return 100000
    }
}

class MyClass {
    
    var myNumber = 1
    
    func addTen() {
        self.myNumber += 10
    }
    
}

/*
class MyClass2: MessageBuilder {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hello " + name
    }
}
*/


/*
 Inheritance
 */

class BankAccount2 {
    
    var accountBalance: Float
    var accountNumber: Int
    
    init(number: Int, balance: Float){
        accountBalance = balance
        accountNumber = number
    }
    
    func displayBalance() {
        print("Your current balance is \(accountBalance)")
        print("Your account number is \(accountNumber)")
    }
    
}

class SavingsAccount: BankAccount2 {
    
    var interstetRate: Float = 0
    
    func calculateInterest() -> Float {
        return accountBalance * interstetRate
    }
    
    override func displayBalance() {
        print("Your current balance is \(accountBalance)")
        print("Your account number is \(accountNumber)")
        print("Your interest rate is \(interstetRate)")
    }
}

/* OR
 super.displayBalance()
 print("prevailing interest rate is \(interestRate)")
 */

/*
 initialize
 
 init(number: Int, balance:Float, rate: Float)
 {
    interestRAte = rate
    super.init(number: number, balance :balance)
 }
 
 */

// Extension

extension Double {
    
    var squared: Double {
        
        return self * self
        
    }
    
    var cubed: Double {
        
        return self * self * self
    }
    
    
}


let my2Value: Double = 3.0
print(my2Value.squared)


//: #Swift Struct

struct SampleStruct {
    
    var name : String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg(){
        "Hello" + name
    }
}

class SampleClass {
    
    var name : String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg(){
        "Hello" + name
    }
}

let myStruct = SampleStruct(name: "Swift")
let myClass = SampleClass(name: "Swift")

myClass.buildHelloMsg()
myStruct.buildHelloMsg()

class SampleClass2 {
    var name : String
    
    init(name: String) {
 
        self.name = name   }
    
    func buildHelloMsg() -> String {
 
        "Hello" + name   }
    
}

let myClass1 = SampleClass2(name: "Swift")
var myClass2 = myClass1
myClass2.name = "Swift2"

print(myClass1.name)
print(myClass2.name)


/*
 enum => enumereration
 it's similiar as a switch case
 */

enum Temperature {
    case hot
    case warm
    case cold

    func describe() {
        switch self {
        case .hot:
            print("It's hot")
        case .warm:
            print("It's warm")
        case .cold:
            print("It's cold")
        }
    }
}

let temp = Temperature.hot
temp.describe()

/*property wrapper*/

struct Address {
    
    private var cityname: String = ""
    
    var city: String {
        get { cityname }
        set { cityname = newValue.uppercased()}
    }
}

var myAddress = Address()
myAddress.city = "New York"
print(myAddress.city)

@propertyWrapper
struct FixCase {
    
    private(set) var value : String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
}

var contact = Contact(name: "John Smith", city: "London", country: "United Kingdom")
print("\(contact.name), \(contact.city), \(contact.country)")

/* array / dictionary */

var tree3Array = ["Pine", "Oak", "Yew"]
var nameArray4 = [String](repeating: "Helloarray", count : 10)

print(nameArray4[4])

var bookDict = ["100-432111" : "Wind in the Willows",
                "100-324322" : "Tale of Two cities",
                "100-432113" : "The Alchemist",
                "100-432114" : "The Great Gatsby"]

print(bookDict.count)

/*
 Error Handling
 */

let connetionOK = true
let connectionSpeed = 30.00
let fileFound = false

enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

func fileTransfer() throws {
    
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    
}

func sendFile() -> string {
    
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return("No connection")
    } catch FileTransferError.lowBandwidth {
        return("File Transfer Speed Too Low")
    }
    
    return("Successful transfer")
}
