//
//  main.swift
//  Map
//
//  Created by A on 2021/01/31.
//

import Foundation

let array = [1, 2, 3, 4, 5]

let increasedResult = array.map { $0 + 1 }
let doubledResult = array.map { $0 * 2 }

print("map 사용 increasedResult: \(increasedResult)")
print("map 사용 doubledResult: \(doubledResult)")

// 배열을 받아서 각 값을 1씩 증가시키고 다시 반환하는 함수
func incrementArray(xs: [Int]) -> [Int] {
    var result = [Int]()
    
    for x in xs {
        result.append(x + 1)
    }
    
    return result
}

// 배열을 받아서 각 값을 2배 한 후 다시 반환하는 함수
func doubleArray(xs: [Int]) -> [Int] {
    var result = [Int]()
    
    for x in xs {
        result.append(x * 2)
    }
    
    return result
}

// 공통 부분 묶어 보기
func computeIntArray(xs: [Int], f: (Int) -> Int) -> [Int] {
    var result = [Int]()
    
    for x in xs {
        result.append(f(x))
    }
    
    return result
}

// 위 함수들 다시 쓰기
func newIncrementArray(xs: [Int]) -> [Int] {
    return computeIntArray(xs: xs) { $0 + 1 } // 후행 클로저 문법 사용
}

func newDoubleArray(xs: [Int]) -> [Int] {
    return computeIntArray(xs: xs) { $0 * 2 }
}

// map 함수는 bool 값을 반환해 주기도 함
let isEvenArray = array.map { $0 % 2 == 0 }
print("map 사용 isEvenArray: \(isEvenArray)")

// bool을 return하는 함수
func computeIntArray(xs: [Int], f: (Int) -> Bool) -> [Bool] {
    var result = [Bool]()
    
    for x in xs {
        result.append(f(x))
    }
    
    return result
}

// 제네릭을 사용하여 반환 타입에 상관없는 함수 만들기
func genericComputeIntArray<U>(xs: [Int], f: (Int) -> U) -> [U] {
    var result = [U]()
    
    for x in xs {
        result.append(f(x))
    }
    
    return result
}

// 입력 값도 타입에 관계없이 만들기
func customMap<T, U>(xs: [T], f: (T) -> U) -> [U] {
    var result = [U]()
    
    for x in xs {
        result.append(f(x))
    }
    
    return result
}

// 위 함수들 customMap 사용해서 바꾸기
func customIsEvenArray(xs: [Int]) -> [Bool] {
    return customMap(xs: xs) { $0 % 2 == 0 }
}

func customDoubleArray(xs: [Int]) -> [Int] {
    return customMap(xs: xs) { $0 * 2 }
}

let isEvenArrayResult = customIsEvenArray(xs: array)
let doubleArrayResylt = customDoubleArray(xs: array)

print()
print("customMap 사용 isEvenArrayResult \(isEvenArrayResult)")
print("customMap 사용 doubleArrayResylt \(doubleArrayResylt)")

// Array extension 적용
extension Array {
    func customMap<U>(f: (Element) -> U) ->[U] {
        var result = [U]()
        
        for x in self {
            result.append(f(x))
        }
        
        return result
    }
}

// customMap 동작 확인
let customMapIncreaseResult = array.customMap { $0 + 1 }
let customMapDoubleResult = array.customMap { $0 * 2 }
let customMapIsEvenResult = array.customMap { $0 % 2 == 0 }

print()
print("customMap increase result: \(customMapIncreaseResult)")
print("customMap double result: \(customMapDoubleResult)")
print("customMap isEven result: \(customMapIsEvenResult)")

