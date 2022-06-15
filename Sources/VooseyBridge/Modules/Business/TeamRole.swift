//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation
import JBS

public enum TeamRole: StringLiteralType, RawRepresentable, Codable, CircularCaseSequence {
	public static let schema = "team_role_enum"
	case owner
	case principal
//	case architect
	case projectManager
	case interiorDesigner
//	case interiorDecorator
	case drafter
	case visualization
	case engineer
	case contractor
	case subContractor
	case developer
	case consultant
	case accountant
//	case lightingDesigner
	case lighting
	case constructionManager
	case landscape
	case surveyor
	case investor
	case admin
	case manager
//	case modeler
//	case logistics
//	case technologyConsultant
//	case structural
//	case mechanical
//	case electrical
//	case lightingEngineer
	
	public var title: String {
		switch self {
			case .owner:
				return "Owner"
			case .principal:
				return "Principal"
			case .projectManager:
				return "Project Manager"
			case .interiorDesigner:
				return "Interior Designer"
			case .drafter:
				return "Drafter"
			case .visualization:
				return "Visualization"
			case .engineer:
				return "Engineer"
			case .contractor:
				return "Contractor"
			case .subContractor:
				return "Subcontractor"
			case .developer:
				return "Developer"
			case .consultant:
				return "Consultant"
			case .accountant:
				return "Accountant"
			case .lighting:
				return "Lighting"
			case .constructionManager:
				return "Construction Manager"
			case .landscape:
				return "Landscape"
			case .surveyor:
				return "Surveyor"
			case .investor:
				return "Investor"
			case .admin:
				return "Admin"
			case .manager:
				return "Manager"
		}
	}
	
	public var ranking: Int {
		switch self {
			case .owner:
				return 1
			case .principal:
				return 2
			case .projectManager:
				return 3
			case .interiorDesigner:
				return 4
			case .admin, .manager:
				return 5
			default: return 6
		}
	}
	
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
			case .admin:
				return true
			case .manager:
				return true
		}
	}
}
