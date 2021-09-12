//
//  Optional.swift
//  
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

protocol OptionalProtocol {
    // the metatype value for the wrapped type.
    static var wrappedType: Any.Type { get }
}

extension Optional : OptionalProtocol {
    static var wrappedType: Any.Type { return Wrapped.self }
}

func isOptional(_ type: Any.Type) -> Bool {
    return type is OptionalProtocol.Type
}

func wrappedType(ofType type: Any.Type) -> Any.Type? {
    return (type as? OptionalProtocol.Type)?.wrappedType
}
