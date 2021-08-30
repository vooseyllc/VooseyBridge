//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public enum SkyboxCategory: StringLiteralType, AssetCategory, RawRepresentable, CaseIterable {
	public static var schema: String {
		"skybox_category_enum"
	}
	
	case sunny
	case sunrise
	case sunset
	case cloudy
	case night
	case other
	
	public var title: String {
		switch self {
			case .sunny:
				return "Sunny"
			case .sunrise:
				return "Sunrise"
			case .sunset:
				return "Sunset"
			case .cloudy:
				return "Cloudy"
			case .night:
				return "Night"
			case .other:
				return "Other"
		}
	}
}
