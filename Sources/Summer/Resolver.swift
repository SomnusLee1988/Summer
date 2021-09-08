//
//  Resolver.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

public protocol Resolver {
    static func resolve<Protocol>(protocolType: Protocol.Type, name: String?) -> Protocol?
}

public protocol ServiceResolver: Resolver {
    
}

public protocol ViewResolver: Resolver {
    
}
