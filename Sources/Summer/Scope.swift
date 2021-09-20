//
//  Scope.swift
//
//  Copyright © 2021 Summer Contributors. All rights reserved.
//

import Foundation

/// Object Scope
public enum Scope {
    // object alive during application's lifecycle
    case singleton
    // object will instantiate when resolving every time
    case prototype
}
