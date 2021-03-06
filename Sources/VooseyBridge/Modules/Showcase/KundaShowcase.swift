//
//  File.swift
//  
//
//  Created by Justin Means on 5/17/21.
//

import Foundation
import JBS

public extension ReportSchema {
	static let showcase = ReportSchema(rawValue: "showcases")
}

public struct KundaShowcase {
	public struct Global: Codable, Identifiable, Hashable {
		public init(tour: [TourItem], micro: KundaShowcase.Micro, business: Business.Micro, isSaved: Bool?) {
			self.tour = tour
			self.micro = micro
			self.business = business
			self.isSaved = isSaved
		}
		
		public var id: UUID? {
			micro.id
		}
		public var tour: [TourItem]
		public var micro: Micro
		public var business: Business.Micro
		public var isSaved: Bool?
	}
	
	public struct Micro: Codable, Identifiable, Hashable, Reportable {
		public var reportMeta: ReportMetadata {
			ReportMetadata(title: self.title, imageURLString: self.featuredImageURL, creatorName: self.business.displayName, date: self.createdDate)
		}
		
		public var schema: ReportSchema { .showcase}
		
		public init(id: UUID? = nil, title: String, description: String? = nil, websiteURL: String? = nil, coordinates: String? = nil, imageURLs: [String], business: Business.Micro, sqft: Double? = nil, beds: Int? = nil, baths: Double? = nil, floors: Double? = nil, garages: Int? = nil, length: Double, depth: Double, height: Double, tags: [String]? = nil, published: Bool, modelURL: String, pdfURL: String? = nil, featuredImageURL: String? = nil, createdDate: Date? = nil, editedDate: Date? = nil) {
			self.id = id
			self.title = title
			self.description = description
			self.websiteURL = websiteURL
			self.coordinates = coordinates
			self.imageURLs = imageURLs
			self.business = business
			self.sqft = sqft
			self.beds = beds
			self.baths = baths
			self.floors = floors
			self.garages = garages
			self.length = length
			self.depth = depth
			self.height = height
			self.tags = tags
			self.published = published
			self.modelURL = modelURL
			self.pdfURL = pdfURL
			self.featuredImageURL = featuredImageURL
			self.createdDate = createdDate
			self.editedDate = editedDate
		}
		
		public var id: UUID?
		public var title: String
		public var description: String?
		public var websiteURL: String?
		public var coordinates: String?
		public var imageURLs: [String]
		public var business: Business.Micro
		public var sqft: Double?
		public var beds: Int?
		public var baths: Double?
		public var floors: Double?
		public var garages: Int?
		public var length: Double
		public var depth: Double
		public var height: Double
		public var tags: [String]?
		public var published: Bool
		public var modelURL: String
		public var pdfURL: String?
		public var featuredImageURL: String?
		public var createdDate: Date?
		public var editedDate: Date?
	}
	
	public struct CreateData: Codable, Identifiable, Hashable {
		public var id: UUID? {
			micro.id
		}
		
		public init(micro: KundaShowcase.Micro, businessID: UUID, tour: [TourItem]) {
			self.micro = micro
			self.businessID = businessID
			self.tour = tour
		}
		
		public var micro: Micro
		public var businessID: UUID
		public var tour: [TourItem]
	}
}
