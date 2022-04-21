//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBSModerate
import JBSCore

public protocol DomaMicroMetaRepresentable: Reportable, Codable, Identifiable, Hashable {
	var meta: DomaMeta { get set }
	var metaMap: MetaMap.Micro { get set }
//	var id: UUID? { get set }
//	var title: String { get set }
//	var description: String? { get set }
//	var websiteURL: String? { get set }
//	var coordinates: String? { get set }
//	var imageURLs: [String] { get set }
//	var business: Business.Micro { get set }
//	var tags: [String]? { get set }
//	var published: Bool { get set }
//	var featuredImageURL: String? { get set }
//	var createdDate: Date? { get set }
//	var updatedDate: Date? { get set }
}

public extension DomaMicroMetaRepresentable {
	var id: UUID? { meta.id }
	var reportMeta: ReportMetadata { ReportMetadata(title: self.meta.title, imageURLString: self.meta.featuredImageURL, creatorName: self.meta.business.displayName, date: self.meta.createdDate) }
}

public struct DomaMeta: Codable, Identifiable, Hashable {
	public init(id: UUID? = nil, title: String, description: String? = nil, websiteURL: String? = nil, coordinates: String? = nil, imageURLs: [String], business: Business.Micro, tags: [String]? = nil, published: Bool, featuredImageURL: String? = nil, createdDate: Date? = nil, updatedDate: Date? = nil, metaType: Metatype, sqft: Float? = nil, beds: Int? = nil, baths: Float? = nil, floors: Float? = nil, garages: Int? = nil, length: Float? = nil, depth: Float? = nil, height: Float? = nil) {
		self.id = id
		self.title = title
		self.description = description
		self.websiteURL = websiteURL
		self.coordinates = coordinates
		self.imageURLs = imageURLs
		self.business = business
		self.tags = tags
		self.published = published
		self.featuredImageURL = featuredImageURL
		self.createdDate = createdDate
		self.updatedDate = updatedDate
		self.metaType = metaType
		self.sqft = sqft
		self.beds = beds
		self.baths = baths
		self.floors = floors
		self.garages = garages
		self.length = length
		self.depth = depth
		self.height = height
	}
	
	public init(metaType: Metatype, business: Business.Micro) {
		self.title = ""
		self.imageURLs = []
		self.business = business
		self.published = true
		self.metaType = metaType
	}
	
	public var id: UUID?
	public var title: String
	public var description: String?
	public var websiteURL: String?
	public var coordinates: String?
	public var imageURLs: [String]
	public var business: Business.Micro
	public var tags: [String]?
	public var published: Bool
	public var featuredImageURL: String?
	public var createdDate: Date?
	public var updatedDate: Date?
#if os(iOS) || os(macOS)
	@NonCodable public var localFeaturedImage: NSUIImage?
#endif
	public var metaType: Metatype
	public var sqft: Float?
	public var beds: Int?
	public var baths: Float?
	public var floors: Float?
	public var garages: Int?
	public var length: Float?
	public var depth: Float?
	public var height: Float?
}

public enum Metatype: String, Codable {
	case showcase
	case product
	case project
}

public protocol DomaGlobalMetaRepresentable: Codable, Identifiable, Hashable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var officialScenes: [DomaScene.Global] { get set }
	var userScenes: [DomaScene.Global] { get set }
	var isSaved: Bool? { get set }
	var metaMap: MetaMap.Global { get set }
}

public protocol DomaCreateMetaRepresentable: Codable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var businessID: UUID { get set }
	var scenes: [DomaScene.Global] { get set }
}
