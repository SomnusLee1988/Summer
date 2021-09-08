//
//  File.swift
//  
//
//  Created by Hui Li on 2021/9/6.
//

import Foundation

struct CatStruct: Animal {
    func makeNoise() {
        print("meow")
    }
}

struct DogStruct: Animal {
    func makeNoise() {
        print("wang")
    }
}
