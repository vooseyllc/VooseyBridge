//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public struct FurnitureData {
	public struct Micro: AssetData {
		public var assetType: AssetType = .furniture
		
		public init(title: String, category: FurnitureCategory, id: UUID? = nil, imageURL: String, modelURL: String, length: Double, height: Double, depth: Double, description: String? = nil, imageURLs: [String]? = nil, priceUSD: Double? = nil, purchaseURL: String? = nil, totalBytes: Int, published: Bool, approved: Bool, anchorPosition: AnchorPosition) {
			self.title = title
			self.category = category
			self.id = id
			self.imageURL = imageURL
			self.modelURL = modelURL
			self.length = length
			self.height = height
			self.depth = depth
			self.description = description
			self.imageURLs = imageURLs
			self.priceUSD = priceUSD
			self.purchaseURL = purchaseURL
			self.totalBytes = totalBytes
			self.published = published
			self.approved = approved
			self.anchorPosition = anchorPosition
		}
		
		public var title: String
		public var category: FurnitureCategory
		public var id: UUID?
		public var imageURL: String
		public var modelURL: String
		public var length: Double
		public var height: Double
		public var depth: Double
		public var description: String?
		public var imageURLs: [String]?
		public var priceUSD: Double?
		public var purchaseURL: String?
		public var totalBytes: Int
		public var published: Bool
		public var approved: Bool
		public var anchorPosition: AnchorPosition
	}
	public struct Global: Codable, Hashable {
		public init(user: User.Micro? = nil, business: Business.Micro? = nil, micro: FurnitureData.Micro) {
			self.user = user
			self.business = business
			self.micro = micro
		}
		
		public var user: User.Micro?
		public var business: Business.Micro?
		public var micro: FurnitureData.Micro
	}
	
	public enum AnchorPosition: String, Codable {
		case floor
		case wall
		case ceiling
	}

}
