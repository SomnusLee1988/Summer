//
//  Autowired.swift
//  
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Autowired<Value> {
    
    private let name: String?
    private var defaultValue: Value
    
    public init(wrappedValue: Value, name: String? = nil) {
        self.name = name
        self.defaultValue = wrappedValue
    }
    
    public init<Wrapped>(name: String? = nil) where Value == Wrapped? {
        self.init(wrappedValue: nil, name: name)
    }
    
    public var wrappedValue: Value {
        get {
            let value = Container.resolve(protocolType: Value.self, name: name)
            return value ?? defaultValue
        }
        
        set {
            defaultValue = newValue
        }
    }
    
    public static subscript<EnclosingSelf>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
    ) -> Value {
        get {
            let name = observed[keyPath: storageKeyPath].name
            let value = Container.resolve(protocolType: Value.self, name: name)

            return value ?? observed[keyPath: storageKeyPath].defaultValue
        }
        set {
            observed[keyPath: storageKeyPath].defaultValue = newValue
        }
    }
    
}

