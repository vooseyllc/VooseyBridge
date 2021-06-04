//
//  File.swift
//  
//
//  Created by Justin Means on 6/2/21.
//

import Foundation

public struct Asset {
	public struct Skybox: Codable {
		public init(backgroundImageURL: String, lightingEnvironmentImageURL: String, previewImage: String, lightingEnvironmentIntensity: CGFloat, sunIntensity: CGFloat) {
			self.backgroundImageURL = backgroundImageURL
			self.lightingEnvironmentImageURL = lightingEnvironmentImageURL
			self.previewImage = previewImage
			self.lightingEnvironmentIntensity = lightingEnvironmentIntensity
			self.sunIntensity = sunIntensity
		}
		
		
//		public var id: UUID
		public var backgroundImageURL: String
		public var lightingEnvironmentImageURL: String
		public var previewImage: String
		public var lightingEnvironmentIntensity: CGFloat
		public var sunIntensity: CGFloat
	}
}
