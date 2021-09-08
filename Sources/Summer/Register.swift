//
//  Register.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

public protocol Register {
    static func register<Protocol>(protocolType: Protocol.Type, name: String?, constructor: @escaping () -> Protocol)
}

public protocol ServiceRegister: Register {
    
}

public protocol ViewRegister: Register {
    
}
