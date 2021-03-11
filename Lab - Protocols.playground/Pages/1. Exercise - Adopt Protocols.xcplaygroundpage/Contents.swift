/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, Comparable, and Codable

 Create a `Human` class with two properties: `name` of type `String` and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    
    // Comparable
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
    
    // Equatable
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    // CustomStringConvertible
    var description: String {
        return "Name: \(name) Age: \(age)"
    }
    
    // Propriedades da classe
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    
    
}

let carlos = Human(name: "Carlos", age: 47)
let pedro = Human(name: "Pedro", age: 16)
print(carlos)
print(pedro)
/*:
 Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
 */


/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are equal to each other (using `==`). Then print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are not equal to each other (using `!=`).
 */
print(carlos == pedro)
print(carlos != pedro)

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let maria = Human(name: "Maria", age: 21)
let joao = Human(name: "João", age: 21)
let marcos = Human(name: "Marcos", age: 27)
let ana = Human(name: "Ana", age: 30)
let people = [maria, ana, joao, marcos]

let sortedPeople = people.sorted(by: <)

/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(maria) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
}

//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
