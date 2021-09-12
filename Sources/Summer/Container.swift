//
//  Container.swift
//  
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

public final class Container {
    
}

extension Container: ServiceRegister {
    
    private static var services = [ServiceKey: ServiceRouter]()
    
    public static func register<Protocol>(protocolType: Protocol.Type, name: String? = nil, constructor: @escaping () -> Protocol) {
        guard !isOptional(protocolType) else {
            fatalError("can not register an optional type[\(protocolType)]!")
        }
        
        let serviceKey = ServiceKey(serviceType: protocolType, name: name)
        let serviceRouter = ServiceRouter(serviceType: protocolType, constructor: constructor)
        
        guard services[serviceKey] == nil else {
            fatalError("service[\(serviceKey)] already registered, cannot register duplicated service!")
        }
        
        services[serviceKey] = serviceRouter
    }
    
    public static func remove<Protocol>(protocolType: Protocol.Type, name: String? = nil) {
        let serviceKey = ServiceKey(serviceType: protocolType, name: name)
        services.removeValue(forKey: serviceKey)
    }
    
    
}

extension Container: ServiceResolver {
    public static func resolve<Protocol>(protocolType: Protocol.Type, name: String?) -> Protocol? {
        var destination: Protocol?
        
        var serviceKey: ServiceKey
        if let wrappedType = wrappedType(ofType: protocolType) {
            serviceKey = ServiceKey(serviceType: wrappedType, name: name)
        } else {
            serviceKey = ServiceKey(serviceType: protocolType, name: name)
        }
        
        if let singleton = Storage.shared.getSingleton(serviceKey),
           let destination = singleton as? Protocol {
            return destination
        }
        if let serviceRouter = services[serviceKey],
           let resolvedInstance = serviceRouter.constructor() as? Protocol {
            
            if serviceRouter.singleton {
                Storage.shared.save(resolvedInstance, forKey: serviceKey)
            }
            
            destination = resolvedInstance
        }
        
        return destination
    }
    
    
}
