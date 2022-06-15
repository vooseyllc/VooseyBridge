//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBS

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
	
	enum CodingKeys: String, CodingKey {
		case id
		case title
		case description
		case websiteURL
		case coordinates
		case imageURLs
		case business
		case tags
		case published
		case featuredImageURL
		case createdDate
		case updatedDate
		case metaType
		case sqft
		case beds
		case baths
		case floors
		case garages
		case length
		case depth
		case height
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.websiteURL = try container.decodeIfPresent(String.self, forKey: .websiteURL)
		self.coordinates = try container.decodeIfPresent(String.self, forKey: .coordinates)
		self.imageURLs = try container.decode([String].self, forKey: .imageURLs)
		self.business = try container.decode(Business.Micro.self, forKey: .business)
		self.tags = try container.decodeIfPresent([String].self, forKey: .tags)
		self.published = try container .decode(Bool.self, forKey: .published)
		self.featuredImageURL = try container.decodeIfPresent(String.self, forKey: .featuredImageURL)
		self.createdDate = try container.decodeIfPresent(Date.self, forKey: .createdDate)
		self.updatedDate = try container.decodeIfPresent(Date.self, forKey: .updatedDate)
		self.metaType = try container.decode(Metatype.self, forKey: .metaType)
		self.sqft = try container.decodeIfPresent(Float.self, forKey: .sqft)
		self.beds = try container.decodeIfPresent(Int.self, forKey: .beds)
		self.baths = try container.decodeIfPresent(Float.self, forKey: .baths)
		self.floors = try container.decodeIfPresent(Float.self, forKey: .floors)
		self.garages = try container.decodeIfPresent(Int.self, forKey: .garages)
		self.length = try container.decodeIfPresent(Float.self, forKey: .length)
		self.depth = try container.decodeIfPresent(Float.self, forKey: .depth)
		self.height = try container.decodeIfPresent(Float.self, forKey: .height)
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(id, forKey: .id)
		try container.encode(title, forKey: .title)
		try container.encodeIfPresent(description, forKey: .description)
		try container.encodeIfPresent(websiteURL, forKey: .websiteURL)
		try container.encodeIfPresent(coordinates, forKey: .coordinates)
		try container.encode(imageURLs, forKey: .imageURLs)
		try container.encode(business, forKey: .business)
		try container.encodeIfPresent(tags, forKey: .tags)
		try container.encode(published, forKey: .published)
		try container.encodeIfPresent(featuredImageURL, forKey: .featuredImageURL)
		try container.encodeIfPresent(createdDate, forKey: .createdDate)
		try container.encodeIfPresent(updatedDate, forKey: .updatedDate)
		try container.encode(metaType, forKey: .metaType)
		try container.encodeIfPresent(sqft, forKey: .sqft)
		try container.encodeIfPresent(beds, forKey: .beds)
		try container.encodeIfPresent(baths, forKey: .baths)
		try container.encodeIfPresent(floors, forKey: .floors)
		try container.encodeIfPresent(garages, forKey: .garages)
		try container.encodeIfPresent(length, forKey: .length)
		try container.encodeIfPresent(depth, forKey: .depth)
		try container.encodeIfPresent(height, forKey: .height)
	}
}

public enum Metatype: String, Codable {
	case showcase
	case product
	case project
	
	public var title: String {
		switch self {
			case .showcase:
				return "Showcase"
			case .product:
				return "Product"
			case .project:
				return "Project"
		}
	}
}

public protocol DomaGlobalMetaRepresentable: Codable, Identifiable, Hashable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var officialScenes: [DomaScene.Global] { get set }
	var userScenes: [DomaScene.Global] { get set }
	var isSaved: Bool? { get set }
	var metaMap: MetaMap.Global { get set }
}

public protocol DomaCreateMetaRepresentable: Codable, Hashable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var businessID: UUID { get set }
	var scenes: [DomaScene.Global] { get set }
}
