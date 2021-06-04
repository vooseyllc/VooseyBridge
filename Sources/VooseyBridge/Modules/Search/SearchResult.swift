//
//  File.swift
//  
//
//  Created by Justin Means on 6/3/21.
//

import Foundation

public enum SearchResult: Codable, Identifiable {
	public var id: String? {
		switch self {
			case .user(let user):
				return user.id.uuidString
			case .business(let business):
				return business.id?.uuidString
			case .showcase(let showcase):
				return showcase.id?.uuidString
			case .tourItem(let tourItem):
				return tourItem.id?.uuidString
		}
	}
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let key = container.allKeys.first
		
		switch key {
			case .user:
				let user = try container.decode(User.Micro.self, forKey: .user)
				self = .user(user)
			case .business:
				let business = try container.decode(Business.Micro.self, forKey: .business)
				self = .business(business)
			case .showcase:
				let showcase = try container.decode(Showcase.Micro.self, forKey: .showcase)
				self = .showcase(showcase)
			case .tourItem:
				let tourItem = try container.decode(TourItem.self, forKey: .tourItem)
				self = .tourItem(tourItem)
			default:
				throw DecodingError.dataCorrupted(
					DecodingError.Context(
						codingPath: container.codingPath,
						debugDescription: "Unabled to decode enum."
					)
				)
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
			case .user(let user):
				try container.encode(user, forKey: .user)
			case .business(let business):
				try container.encode(business, forKey: .business)
			case .showcase(let showcase):
				try container.encode(showcase, forKey: .showcase)
			case .tourItem(let tourItem):
				try container.encode(tourItem, forKey: .tourItem)
		}
	}
	
	enum CodingKeys: CodingKey {
		case user
		case business
		case showcase
		case tourItem
	}
	
	case user(User.Micro)
	case business(Business.Micro)
	case showcase(Showcase.Micro)
	case tourItem(TourItem)
}
