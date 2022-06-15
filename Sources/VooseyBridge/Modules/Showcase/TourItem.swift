//
//  File.swift
//  
//
//  Created by Justin Means on 5/31/21.
//

import Foundation
#if os(macOS)
import AppKit
#endif
#if os(iOS)
import UIKit
#endif
import JBS

//TODO: Add multi camera support
public struct TourItem: Codable, Hashable {
	#if !os(Linux)
	public init(id: UUID? = nil, showcase: KundaShowcase.Micro? = nil, camPosition: VooseyVector3, camOrientation: VooseyVector4, camPov: Float, title: String, description: String? = nil, imageURL: String? = nil, exposureOffset: Float? = nil, enableDepthOfField: Bool? = nil, aperture: Float? = nil, focusDistance: Float? = nil, duration: Float? = nil, sunAzimuth: Float? = nil, sunAltitude: Float? = nil, sunIntensity: Float? = nil, lightingEnvironmentIntensity: Float? = nil, shadowRadius: Float? = nil, shadowOpacity: Float? = nil, skyboxBackgroundImageURL: String? = nil, skyboxLightingEnvironmentImageURL: String? = nil, localImage: NSUIImage? = nil, clippingPlaneElevation: Float? = nil, enableClippingPlane: Bool? = nil, skyboxRotationDegrees: Float? = nil, cameraType: VooseyCameraType?) {
		self.id = id
		self.showcase = showcase
		self.camPosition = camPosition
		self.camOrientation = camOrientation
		self.camPov = camPov
		self.title = title
		self.description = description
		self.imageURL = imageURL
		self.exposureOffset = exposureOffset
		self.enableDepthOfField = enableDepthOfField
		self.aperture = aperture
		self.focusDistance = focusDistance
		self.duration = duration
		self.sunAzimuth = sunAzimuth
		self.sunAltitude = sunAltitude
		self.sunIntensity = sunIntensity
		self.lightingEnvironmentIntensity = lightingEnvironmentIntensity
		self.shadowRadius = shadowRadius
		self.shadowOpacity = shadowOpacity
		self.skyboxBackgroundImageURL = skyboxBackgroundImageURL
		self.skyboxLightingEnvironmentImageURL = skyboxLightingEnvironmentImageURL
		self.localImage = localImage
		self.clippingPlaneElevation = clippingPlaneElevation
		self.enableClippingPlane = enableClippingPlane
		self.skyboxRotationDegrees = skyboxRotationDegrees
		self.cameraType = cameraType
	}
	#endif
	public init(id: UUID? = nil, showcase: KundaShowcase.Micro? = nil, camPosition: VooseyVector3, camOrientation: VooseyVector4, camPov: Float, title: String, description: String? = nil, imageURL: String? = nil, exposureOffset: Float? = nil, enableDepthOfField: Bool? = nil, aperture: Float? = nil, focusDistance: Float? = nil, duration: Float? = nil, sunAzimuth: Float? = nil, sunAltitude: Float? = nil, sunIntensity: Float? = nil, lightingEnvironmentIntensity: Float? = nil, shadowRadius: Float? = nil, shadowOpacity: Float? = nil, skyboxBackgroundImageURL: String? = nil, skyboxLightingEnvironmentImageURL: String? = nil, clippingPlaneElevation: Float? = nil, enableClippingPlane: Bool? = nil, skyboxRotationDegrees: Float? = nil, cameraType: VooseyCameraType?) {
		self.id = id
		self.showcase = showcase
		self.camPosition = camPosition
		self.camOrientation = camOrientation
		self.camPov = camPov
		self.title = title
		self.description = description
		self.imageURL = imageURL
		self.exposureOffset = exposureOffset
		self.enableDepthOfField = enableDepthOfField
		self.aperture = aperture
		self.focusDistance = focusDistance
		self.duration = duration
		self.sunAzimuth = sunAzimuth
		self.sunAltitude = sunAltitude
		self.sunIntensity = sunIntensity
		self.lightingEnvironmentIntensity = lightingEnvironmentIntensity
		self.shadowRadius = shadowRadius
		self.shadowOpacity = shadowOpacity
		self.skyboxBackgroundImageURL = skyboxBackgroundImageURL
		self.skyboxLightingEnvironmentImageURL = skyboxLightingEnvironmentImageURL
		self.clippingPlaneElevation = clippingPlaneElevation
		self.enableClippingPlane = enableClippingPlane
		self.skyboxRotationDegrees = skyboxRotationDegrees
		self.cameraType = cameraType
	}
	
	public var id: UUID?
	public var showcase: KundaShowcase.Micro?
	public var camPosition: VooseyVector3
	public var camOrientation: VooseyVector4
	public var camPov: Float
	public var title: String
	public var description: String?
	public var imageURL: String?
	public var exposureOffset: Float?
	public var enableDepthOfField: Bool?
	public var aperture: Float?
	public var focusDistance: Float?
	public var duration: Float?
	public var sunAzimuth: Float?
	public var sunAltitude: Float?
	public var sunIntensity: Float?
	public var lightingEnvironmentIntensity: Float?
	public var shadowRadius: Float?
	public var shadowOpacity: Float?
	public var skyboxBackgroundImageURL: String?
	public var skyboxLightingEnvironmentImageURL: String?
	public var clippingPlaneElevation: Float?
	public var enableClippingPlane: Bool?
	public var skyboxRotationDegrees: Float?
	public var cameraType: VooseyCameraType?
	
	#if os(macOS)
	public var localImage: NSUIImage?
	#endif
	#if os(iOS)
	public var localImage: UIImage?
	#endif
	
	enum CodingKeys: String, CodingKey {
		case id
		case showcase
		case camPosition
		case camOrientation
		case camPov
		case title
		case description
		case imageURL
		case exposureOffset
		case enableDepthOfField
		case aperture
		case focusDistance
		case duration
		case sunAzimuth
		case sunAltitude
		case sunIntensity
		case lightingEnvironmentIntensity
		case shadowRadius
		case shadowOpacity
		case skyboxBackgroundImageURL
		case skyboxLightingEnvironmentImageURL
		case clippingPlaneElevation
		case enableClippingPlane
		case skyboxRotationDegrees
		case cameraType
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = try encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(showcase, forKey: .showcase)
		try container.encode(camPosition, forKey: .camPosition)
		try container.encode(camOrientation, forKey: .camOrientation)
		try container.encode(camPov, forKey: .camPov)
		try container.encode(title, forKey: .title)
		try container.encodeIfPresent(description, forKey: .description)
		try container.encode(imageURL, forKey: .imageURL)
		try container.encode(exposureOffset, forKey: .exposureOffset)
		try container.encodeIfPresent(enableDepthOfField, forKey: .enableDepthOfField)
		try container.encodeIfPresent(aperture, forKey: .aperture)
		try container.encodeIfPresent(focusDistance, forKey: .focusDistance)
		try container.encodeIfPresent(duration, forKey: .duration)
		try container.encodeIfPresent(sunAzimuth, forKey: .sunAzimuth)
		try container.encodeIfPresent(sunAltitude, forKey: .sunAltitude)
		try container.encodeIfPresent(sunIntensity, forKey: .sunIntensity)
		try container.encodeIfPresent(lightingEnvironmentIntensity, forKey: .lightingEnvironmentIntensity)
		try container.encodeIfPresent(shadowRadius, forKey: .shadowRadius)
		try container.encodeIfPresent(shadowOpacity, forKey: .shadowOpacity)
		try container.encodeIfPresent(skyboxBackgroundImageURL, forKey: .skyboxBackgroundImageURL)
		try container.encodeIfPresent(skyboxLightingEnvironmentImageURL, forKey: .skyboxLightingEnvironmentImageURL)
		try container.encodeIfPresent(clippingPlaneElevation, forKey: .clippingPlaneElevation)
		try container.encodeIfPresent(enableClippingPlane, forKey: .enableClippingPlane)
		try container.encodeIfPresent(skyboxRotationDegrees, forKey: .skyboxRotationDegrees)
		try container.encodeIfPresent(cameraType, forKey: .cameraType)
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.showcase = try container.decodeIfPresent(KundaShowcase.Micro.self, forKey: .showcase)
		self.camPosition = try container.decode(VooseyVector3.self, forKey: .camPosition)
		self.camOrientation = try container.decode(VooseyVector4.self, forKey: .camOrientation)
		self.camPov = try container.decode(Float.self, forKey: .camPov)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL)
		self.exposureOffset = try container.decodeIfPresent(Float.self, forKey: .exposureOffset)
		self.enableDepthOfField = try container.decodeIfPresent(Bool.self, forKey: .enableDepthOfField)
		self.aperture = try container.decodeIfPresent(Float.self, forKey: .aperture)
		self.focusDistance = try container.decodeIfPresent(Float.self, forKey: .focusDistance)
		self.duration = try container.decodeIfPresent(Float.self, forKey: .duration)
		self.sunAzimuth = try container.decodeIfPresent(Float.self, forKey: .sunAzimuth)
		self.sunAltitude = try container.decodeIfPresent(Float.self, forKey: .sunAltitude)
		self.sunIntensity = try container.decodeIfPresent(Float.self, forKey: .sunIntensity)
		self.lightingEnvironmentIntensity = try container.decodeIfPresent(Float.self, forKey: .lightingEnvironmentIntensity)
		self.shadowRadius = try container.decodeIfPresent(Float.self, forKey: .shadowRadius)
		self.shadowOpacity = try container.decodeIfPresent(Float.self, forKey: .shadowOpacity)
		self.skyboxBackgroundImageURL = try container.decodeIfPresent(String.self, forKey: .skyboxBackgroundImageURL)
		self.skyboxLightingEnvironmentImageURL = try container.decodeIfPresent(String.self, forKey: .skyboxLightingEnvironmentImageURL)
		self.enableClippingPlane = try container.decodeIfPresent(Bool.self, forKey: .enableClippingPlane)
		self.clippingPlaneElevation = try container.decodeIfPresent(Float.self, forKey: .clippingPlaneElevation)
		self.skyboxRotationDegrees = try container.decodeIfPresent(Float.self, forKey: .skyboxRotationDegrees)
		self.cameraType = try container.decodeIfPresent(VooseyCameraType.self, forKey: .cameraType)
	}
}
