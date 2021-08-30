//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public enum FurnitureCategory: StringLiteralType, AssetCategory, RawRepresentable, CaseIterable {
	public static var schema: String {
		"furniture_category_enum"
	}
	
	case landscaping
	case chairs
	case tablesDesks
	case beds
	case couches
	case wardrobes
	case lighting
	case indoorPlants
	case textiles
	case patio
	case media
	
	public var title: String {
		switch self {
				
			case .landscaping:
				return "Landscaping"
			case .chairs:
				return "Chairs"
			case .tablesDesks:
				return "Tables and Desks"
			case .beds:
				return "Beds"
			case .couches:
				return "Sofas, Couches, and Armchairs"
			case .wardrobes:
				return "Wardrobes, Armoires, and Dressers"
			case .lighting:
				return "Light Fixtures"
			case .indoorPlants:
				return "Indoor Plants"
			case .textiles:
				return "Rugs, Curtains, and Textiles"
			case .patio:
				return "Patio"
			case .media:
				return "TV's and Media"
		}
	}
}
