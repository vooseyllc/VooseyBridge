//
//  File.swift
//  
//
//  Created by Justin Means on 5/23/22.
//

import Foundation

public enum VooseyCameraType: String, Codable, RawRepresentable {
case firstPerson
case thirdPerson
case thirdPersonOrthographic
	
	public var shortDisplayName: String {
		switch self {
			case .firstPerson:
				return "1"
			case .thirdPerson:
				return "3"
			case .thirdPersonOrthographic:
				return "O"
		}
	}
	
	public var displayName: String {
		switch self {
			case .firstPerson:
				return "First Person"
			case .thirdPerson:
				return "Third Person"
			case .thirdPersonOrthographic:
				return "Orthographic"
		}
	}
}
