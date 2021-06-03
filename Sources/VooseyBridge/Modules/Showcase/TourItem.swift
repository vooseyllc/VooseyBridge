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

public struct TourItem: Codable, Hashable {
	#if os(macOS)
	public init(id: UUID? = nil, showcase: Showcase.Micro?, camPosition: VooseyVector3, camOrientation: VooseyVector4, camPov: Double, title: String, description: String?, imageURL: String?, localImage: NSImage?) {
		self.id = id
		self.showcase = showcase
		self.camPosition = camPosition
		self.camOrientation = camOrientation
		self.camPov = camPov
		self.title = title
		self.description = description
		self.imageURL = imageURL
		self.localImage = localImage
	}
	#endif
	#if os(iOS)
	public init(id: UUID? = nil, showcase: Showcase.Micro?, camPosition: VooseyVector3, camOrientation: VooseyVector4, camPov: Double, title: String, description: String?, imageURL: String?, localImage: UIImage?) {
		self.id = id
		self.showcase = showcase
		self.camPosition = camPosition
		self.camOrientation = camOrientation
		self.camPov = camPov
		self.title = title
		self.description = description
		self.imageURL = imageURL
		self.localImage = localImage
	}
	#endif
	public init(id: UUID? = nil, showcase: Showcase.Micro?, camPosition: VooseyVector3, camOrientation: VooseyVector4, camPov: Double, title: String, description: String?, imageURL: String?) {
		self.id = id
		self.showcase = showcase
		self.camPosition = camPosition
		self.camOrientation = camOrientation
		self.camPov = camPov
		self.title = title
		self.description = description
		self.imageURL = imageURL
	}
	
	public var id: UUID?
	public var showcase: Showcase.Micro?
	public var camPosition: VooseyVector3
	public var camOrientation: VooseyVector4
	public var camPov: Double
	public var title: String
	public var description: String?
	public var imageURL: String?
	#if os(macOS)
	public var localImage: NSImage?
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
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.showcase = try container.decodeIfPresent(Showcase.Micro.self, forKey: .showcase)
		self.camPosition = try container.decode(VooseyVector3.self, forKey: .camPosition)
		self.camOrientation = try container.decode(VooseyVector4.self, forKey: .camOrientation)
		self.camPov = try container.decode(Double.self, forKey: .camPov)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL)
	}
}
