//
//  File.swift
//  
//
//  Created by Hui Li on 2021/9/6.
//

import Foundation
import Summer

struct HumanStruct {
    var pet: Animal?
    
    func play() {
        pet?.makeNoise()
    }
}

class HumanClass {
    
    @Autowired(name: "cat")
    var cat: Animal?
    
    func play() {
        cat?.makeNoise()
    }
}
