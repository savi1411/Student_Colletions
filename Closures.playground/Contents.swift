struct Track: Comparable {
    var trackNumber: Int

    static func < (lhs: Track, rhs: Track) -> Bool {
        return lhs.trackNumber < rhs.trackNumber
    }
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]

let sortedTracks = tracks.sorted(by: <)
sortedTracks

// Collection Functions using Closures

// 1. Map

// Initial array
let namesNoMap = ["Johnny", "Nellie", "Aaron", "Rachel"]

// Creates an empty array that will be used to store the full names
var fullNamesNoMap: [String] = []

for name in namesNoMap {
    let fullName = name + " Smith"
    fullNamesNoMap.append(fullName)
}

// Usando o Map
let names = ["Johnny", "Nellie", "Aaron", "Rachel"]

// Creates a new array of full names by adding "Smith" to each first name
let fullNames = names.map { (name) -> String in
    return name + " Smith"
}
fullNames

// Forma simplificada
let fullNamesSimplified = names.map { $0 + " Smith" }
fullNamesSimplified

// 2. Filter
let numbersNoFilter = [4, 8, 15, 16, 23, 42]
var numbersLessThan20NoFilter: [Int] = []

for number in numbersNoFilter {
    if number < 20 {
        numbersLessThan20NoFilter.append(number)
    }
}

print(numbersLessThan20NoFilter)

// Usando filter
let numbersFilter = [4, 8, 15, 16, 23, 42]
let numbersLessThan20 = numbersFilter.filter { (number) -> Bool in
    return number < 20
}

print(numbersLessThan20)

// Sintaxe simplificada
let numbersLessThan20Simplified = numbersFilter.filter { $0 < 20 }
numbersLessThan20Simplified

// 3. Reduce

// Sintaxe Padrão (jeito rústico)
let numbersNoReduce = [8, 6, 7, 5, 3, 0, 9]
var totalNoReduce = 0

for number in numbersNoReduce {
    totalNoReduce = totalNoReduce + number
}
totalNoReduce

// Usando o reduce
let numbers = [8, 6, 7, 5, 3, 0, 9]
let total = numbers.reduce(0) { (currentTotal, newValue) -> Int in
    return currentTotal + newValue
}
total

// Forma simplificada
let totalSimplified = numbers.reduce(0) { $0 + $1 }
totalSimplified

// Forma mega simplificada
let totalMegaSimplified = numbers.reduce(0, +)

