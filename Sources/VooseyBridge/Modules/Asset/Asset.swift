//
//  File.swift
//  
//
//  Created by Justin Means on 6/2/21.
//

import Foundation
#if os(iOS)
import CoreGraphics
#endif

public struct Asset {
	public struct Skybox: Codable {
		public init(backgroundImageURL: String, lightingEnvironmentImageURL: String, previewImage: String, lightingEnvironmentIntensity: CGFloat, sunIntensity: CGFloat, title: String) {
			self.backgroundImageURL = backgroundImageURL
			self.lightingEnvironmentImageURL = lightingEnvironmentImageURL
			self.previewImage = previewImage
			self.lightingEnvironmentIntensity = lightingEnvironmentIntensity
			self.sunIntensity = sunIntensity
			self.title = title
		}
		
		public var backgroundImageURL: String
		public var lightingEnvironmentImageURL: String
		public var previewImage: String
		public var lightingEnvironmentIntensity: CGFloat
		public var sunIntensity: CGFloat
		public var title: String
		
	}
	
//	public struct Material: Codable {
//		public init(imageURL: String, )
//	}
}
