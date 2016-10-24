//: Playground - noun: a place where people can play

import Cocoa

/*
 Multiples of 3 and 5
 Problem 1
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Find the sum of all the multiples of 3 or 5 below 1000.
*/
protocol GeneratorType {
    associatedtype Element
    mutating func next() -> Element?
}

struct MultipleOfThree: GeneratorType {
    var state = 0
    mutating func next() -> Int? {
        state +=  1
        return state * 3
    }
}

struct MultipleOfFive: GeneratorType {
    var state = 0
    mutating func next() -> Int? {
        state +=  1
        return state * 5
    }
}

var threeGenerator = MultipleOfThree()
var fiveGenerator = MultipleOfFive()
var sum = 0
let max = 1000

while true {
    let x:Int = threeGenerator.next()!
    let y:Int = fiveGenerator.next()!
    
    if x < max || y < max {
        if x < max && x % 5 != 0 { sum += x }
        if y < max { sum += y }
        print("sum: \(sum),\(x), \(y)")
    } else {
        break
    }
}

sum
//233168
