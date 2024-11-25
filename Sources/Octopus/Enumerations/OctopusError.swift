//
//  OctopusError.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

public enum OctopusError: Error {
    case decode(Error)
    case encode(Error)
}
