//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public enum TeamRole: StringLiteralType, RawRepresentable, Codable {
	public static let schema = "team_role_enum"
	case owner
	case principal
	case projectManager
	case interiorDesigner
	case drafter
	case visualization
	case engineer
	case contractor
	case subContractor
	case developer
	case consultant
	case accountant
	case lighting
	case constructionManager
	case landscape
	case surveyor
	case investor
	
	public var hasPrivateAccess: Bool {
		switch self {
			
			case .owner:
				return true
			case .principal:
				return true
			case .projectManager:
				return true
			case .interiorDesigner:
				return true
			case .drafter:
				return true
			case .visualization:
				return true
			case .engineer:
				return false
			case .contractor:
				return false
			case .subContractor:
				return false
			case .developer:
				return false
			case .consultant:
				return false
			case .accountant:
				return true
			case .lighting:
				return false
			case .constructionManager:
				return false
			case .landscape:
				return false
			case .surveyor:
				return false
			case .investor:
				return false
		}
	}
}
