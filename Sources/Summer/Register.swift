//
//  Register.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

public protocol Register {
    
    /// Register a service
    /// - Parameters:
    ///   - protocolType: service protocol metatype
    ///   - name: service name
    ///   - scope: resolved object scope
    ///   - constructor: factory function
    static func register<Protocol>(protocolType: Protocol.Type, name: String?, scope: Scope, constructor: @escaping () -> Protocol)
}

public protocol ServiceRegister: Register {
    
}

public protocol ViewRegister: Register {
    
}
