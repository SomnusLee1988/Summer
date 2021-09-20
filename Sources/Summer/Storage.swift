//
//  Storage.swift
//  
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

class Storage {
    static let shared = Storage()
    
    private var singletonInstances = [AnyHashable: Any]()
        
    private let queue = DispatchQueue(label: "com.summer.core", attributes: .concurrent)
        
    func getSingleton<T: Hashable>(_ routeKey: T) -> Any? {
        return queue.sync {
            return singletonInstances[routeKey]
        }
    }
    
    func save<Key: Hashable, Value: Any>(_ value: Value, forKey key: Key) {
        queue.async(flags: .barrier) {
            self.singletonInstances[key] = value
        }
    }
}
