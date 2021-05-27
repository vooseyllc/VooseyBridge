//
//  File.swift
//  
//
//  Created by Justin Means on 5/17/21.
//

import Foundation

public struct Showcase {
	public struct Global: Codable, Identifiable, Hashable {
		public init(micro: Showcase.Micro, business: Business.Micro) {
			self.micro = micro
			self.business = business
		}
		
		public var id: UUID? {
			micro.id
		}
		public var micro: Micro
		public var business: Business.Micro
	}
	
	public struct Micro: Codable, Identifiable, Hashable {
		public init(id: UUID? = nil, title: String, description: String? = nil, websiteURL: String? = nil, coordinates: String? = nil, imageURLs: [String], business: Business.Micro, sqft: Double? = nil, beds: Int? = nil, baths: Double? = nil, floors: Double? = nil, garages: Int? = nil, length: Double, depth: Double, height: Double, tags: [String]? = nil, published: Bool, modelURL: String, pdfURL: String? = nil) {
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
	}
	
	public struct UploadData: Codable, Identifiable, Hashable {
		public var id: UUID? {
			micro.id
		}
		
		public init(micro: Showcase.Micro, businessID: UUID) {
			self.micro = micro
			self.businessID = businessID
		}
		
		public var micro: Micro
		public var businessID: UUID
	}
}
