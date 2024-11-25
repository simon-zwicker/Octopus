//
//  Encodable.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import Foundation

public extension Encodable {
    
    /// encode the encodable struct to Data object
    func encode() throws(OctopusError) -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            throw .encode(error)
        }
    }
}
