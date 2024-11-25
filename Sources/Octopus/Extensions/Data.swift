//
//  Data.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import Foundation

public extension Data {
    
    /// decode Data to given codable struct
    func decode<T: Codable>(_ type: T.Type) throws(OctopusError) -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            throw .decode(error)
        }
    }
}
