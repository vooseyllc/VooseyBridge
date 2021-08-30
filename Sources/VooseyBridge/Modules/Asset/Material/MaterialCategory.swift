//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public enum MaterialCategory: StringLiteralType, AssetCategory, RawRepresentable, CaseIterable {
	public static var schema: String {
		"material_category_enum"
	}
	
	case paint
	case wood
	case textile
	case tile
	case stone
	case plaster
	case metal
	case environment
	case countertop
	case other
	
	public var title: String {
		switch self {
			
			case .paint:
				return "Paint"
			case .wood:
				return "Wood"
			case .textile:
				return "Textiles"
			case .tile:
				return "Tile"
			case .stone:
				return "Stone"
			case .plaster:
				return "Plaster"
			case .metal:
				return "Metals"
			case .environment:
				return "Environment"
			case .countertop:
				return "Countertop"
			case .other:
				return "Other"
		}
	}
}
