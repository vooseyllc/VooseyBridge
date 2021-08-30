//
//  File.swift
//  
//
//  Created by Justin Means on 6/2/21.
//

import Foundation

public struct SkyboxData {
	public struct Micro: AssetData {
		public var assetType: AssetType = .skybox
		
		public init(backgroundImageURL: String, lightingEnvironmentImageURL: String, imageURL: String, lightingEnvironmentIntensity: Float, sunIntensity: Float, title: String, category: SkyboxCategory, approved: Bool = false, published: Bool = true) {
			self.backgroundImageURL = backgroundImageURL
			self.lightingEnvironmentImageURL = lightingEnvironmentImageURL
			self.imageURL = imageURL
			self.lightingEnvironmentIntensity = lightingEnvironmentIntensity
			self.sunIntensity = sunIntensity
			self.title = title
			self.category = category
			self.approved = approved
			self.published = published
		}
		public var id: UUID?
		public var backgroundImageURL: String
		public var lightingEnvironmentImageURL: String
		public var imageURL: String
		public var lightingEnvironmentIntensity: Float
		public var sunIntensity: Float
		public var title: String
		public var category: SkyboxCategory
		public var approved: Bool
		public var published: Bool
	}
	
	public struct Global: Codable, Hashable {
		public init(business: Business.Micro? = nil, user: User.Micro? = nil, micro: SkyboxData.Micro) {
			self.business = business
			self.user = user
			self.micro = micro
		}
		
		public var business: Business.Micro?
		public var user: User.Micro?
		public var micro: SkyboxData.Micro
	}
}
