//: Playground - noun: a place where people can play

import UIKit

// Equality Functions - Without Generics

func equalInt(_ a: Int, _ b: Int) -> Bool       { return a == b }
func equalStr(_ a: String, _ b: String) -> Bool { return a == b }
func equalDbl(_ a: Double, _ b: Double) -> Bool { return a == b }

// Equality Function - With Generics

func equal<T: Equatable>(_ a: T, _ b: T) -> Bool { return a == b }

// Array Randomizer Function - With Generics

func arrayRandomize<T>(var arr: [T]) -> [T] {
    
    for i in 0...arr.count-1 {
        var rand = Int(arc4random_uniform(UInt32(arr.count)))
        var temp = arr[i]
        arr[i] = arr[rand]
        arr[rand] = temp
    }
    return arr
    
}

// Quicksort Algorithm Function - With Generics

func quicksort<T: Comparable>(var toSort: [T]) -> [T] {
    
    if !toSort.isEmpty {
        var less: [T] = []
        var equal: [T] = []
        var more: [T] = []
        var pivot = toSort[0]
        for i in toSort {
            if i > pivot {
                more.append(i)
            } else if i == pivot {
                equal.append(i)
            } else if i < pivot {
                less.append(i)
            }
        }
        return quicksort(less) + equal + quicksort(more)
    }
    
    return []
    
}

let letters = ["A3", "A1", "A2", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U" , "V", "W", "X", "Y", "Z"]
let randomized = arrayRandomize(letters)
quicksort(randomized)
quicksort(letters)

//let a = [35.2, 34.5, 48.6, 324.67, 487.46]
//let random = arrayRandomize(a)
//quicksort(random)
//quicksort(a)