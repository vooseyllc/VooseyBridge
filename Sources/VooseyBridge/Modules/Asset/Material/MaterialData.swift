//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public struct MaterialData {
	public struct Micro: AssetData {
		public var assetType: AssetType = .material
		
		public init(title: String, id: UUID? = nil, roughness: Float? = nil, metalness: Float? = nil, specular: Float? = nil, diffuse: Float? = nil, opacity: Float? = nil, category: MaterialCategory, imageURL: String, approved: Bool, published: Bool) {
			self.title = title
			self.id = id
			self.roughness = roughness
			self.metalness = metalness
			self.specular = specular
			self.diffuse = diffuse
			self.opacity = opacity
			self.category = category
			self.imageURL = imageURL
			self.approved = approved
			self.published = published
		}
		
		public var title: String
		public var id: UUID?
		public var roughness: Float?
		public var metalness: Float?
		public var specular: Float?
		public var diffuse: Float?
		public var opacity: Float?
		public var category: MaterialCategory
		public var imageURL: String
		public var approved: Bool
		public var published: Bool
	}
	
	public struct Global: Codable, Hashable {
		public init(user: User.Micro? = nil, business: Business.Micro? = nil, micro: MaterialData.Micro) {
			self.user = user
			self.business = business
			self.micro = micro
		}
		
		public var user: User.Micro?
		public var business: Business.Micro?
		public var micro: MaterialData.Micro
	}
	
}

