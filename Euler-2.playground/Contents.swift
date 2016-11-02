//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
func fibGenerator() -> AnyIterator<Int> {
    var state = (0, 1)
    return AnyIterator {
        let result = state.0
        state = (state.1, state.0 + state.1)
        return result
    }
}

func accumulate(_ max:Int) -> Int {
    let fibSequence = fibGenerator().makeIterator()
    var accum = 0
    var fb = 0
    while true {
        
        fb = fibSequence.next()!
        if fb % 2 == 0  {
            accum += fb
        }
        
        if accum >= max {
            break
        }
    }
    return accum
}

accumulate(4000000)



