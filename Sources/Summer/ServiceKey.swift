//
//  ServiceKey.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

protocol RouterKey: Hashable {
}

struct ServiceKey: RouterKey {
    let serviceType: Any.Type
    let name: String?
}

extension ServiceKey: Hashable {
    
    static func == (lhs: ServiceKey, rhs: ServiceKey) -> Bool {
        return lhs.name == rhs.name && lhs.serviceType == rhs.serviceType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(ObjectIdentifier(serviceType))
    }
    
}
