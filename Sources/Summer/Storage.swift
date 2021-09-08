//
//  Storage.swift
//  
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

class Storage {
    static let shared = Storage()
    
    private var singletonInstances = [AnyHashable: Any]()
    
    private let lock = NSLock()
        
    func getSingleton<T: Hashable>(_ routeKey: T) -> Any? {
        lock.lock()
        defer {
            lock.unlock()
        }
        return singletonInstances[routeKey]
    }
    
    func save<Key: Hashable, Value: Any>(_ value: Value, forKey key: Key) {
        lock.lock()
        defer {
            lock.unlock()
        }
        singletonInstances[key] = value
    }
}
