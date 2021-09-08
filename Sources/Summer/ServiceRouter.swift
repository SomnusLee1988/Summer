//
//  ServiceRouter.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

protocol RouterObject {
    
}

class ServiceRouter: RouterObject {
    
    typealias Constructor = () -> Any
    
    let serviceType: Any.Type
    let constructor: Constructor
    let singleton: Bool
    
    init(serviceType: Any.Type, constructor: @escaping Constructor, singleton: Bool = true) {
        self.serviceType = serviceType
        self.constructor = constructor
        self.singleton = singleton
    }
}
