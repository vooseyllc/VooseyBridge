//
//  File.swift
//  
//
//  Created by Justin Means on 4/20/22.
//

import Foundation
import JBS

public enum SortMode: String, Codable, CircularCaseSequence {
	case aZ
	case zA
	case sqftLH
	case sqftHL
	case bedsLH
	case bedsHL
	case priceLH
	case priceHL
	case mostRecent
	case mostPopular
	
	public var order: Order? {
		switch self {
			case .aZ:
				return .ascending
			case .zA:
				return .descending
			case .sqftLH:
				return .ascending
			case .sqftHL:
				return  .descending
			case .priceLH:
				return .ascending
			case .priceHL:
				return .descending
			default: return nil
		}
	}
	
	public enum Order {
		case ascending
		case descending
		
		public var title: String {
			switch self {
				case .ascending:
					return "Ascending"
				case .descending:
					return "Descending"
			}
		}
	}
	
	public var altTitle: String {
		switch self {
			case .aZ:
				return "A to Z"
			case .zA:
				return "Z to A"
			case .sqftLH:
				return "Sqft Low to High"
			case .sqftHL:
				return "Sqft High to Low"
			case .bedsLH:
				return "Beds Low to High"
			case .bedsHL:
				return "Beds High to Low"
			case .priceLH:
				return "Price Low to High"
			case .priceHL:
				return "Price High to Low"
			case .mostRecent:
				return "Most Recent"
			case .mostPopular:
				return "Most Popular"
		}
	}
	
	public var title: String {
		switch self {
			case .aZ:
				return "Alphabetical"
			case .zA:
				return "Alphabetical"
			case .sqftLH:
				return "Square Footage"
			case .sqftHL:
				return "Square Footage"
			case .bedsLH:
				return "Bedrooms"
			case .bedsHL:
				return "Bedrooms"
			case .priceLH:
				return "Price"
			case .priceHL:
				return "Price"
			case .mostRecent:
				return "Most Recent"
			case .mostPopular:
				return "Most Popular"
		}
	}
}
