//
//  File.swift
//
//
//  Created by Justin Means on 3/1/22.
//

import Foundation
import JBSModerate

public struct Doma {
	public struct Global: Codable, Identifiable, Hashable {
		public init(micro: Doma.Micro, business: Business.Micro) {
			self.micro = micro
			self.business = business
		}
		
		public var id: UUID? { micro.id }
		public var micro: Micro
		public var business: Business.Micro
	}
	
	public struct Micro: Codable, Identifiable, Hashable {
		public init(id: UUID? = nil, title: String? = nil, description: String, sqft: Float? = nil, beds: Int? = nil, baths: Float? = nil, floors: Float? = nil, garages: Int? = nil, length: Float, depth: Float, height: Float, modelURL: String, featuredImageURL: String? = nil, createdDate: Date? = nil, updatedDate: Date? = nil) {
			self.id = id
			self.title = title
			self.description = description
			self.sqft = sqft
			self.beds = beds
			self.baths = baths
			self.floors = floors
			self.garages = garages
			self.length = length
			self.depth = depth
			self.height = height
			self.modelURL = modelURL
			self.featuredImageURL = featuredImageURL
			self.createdDate = createdDate
			self.updatedDate = updatedDate
		}
		
		
		public var id: UUID?
		public var title: String?
		public var description: String
		public var sqft: Float?
		public var beds: Int?
		public var baths: Float?
		public var floors: Float?
		public var garages: Int?
		public var length: Float
		public var depth: Float
		public var height: Float
		public var modelURL: String
		public var featuredImageURL: String?
		public var createdDate: Date?
		public var updatedDate: Date?
		//Scenes in real data model
	}
	
	public struct Create: Codable {
		public init(micro: Doma.Micro, businessID: UUID) {
			self.micro = micro
			self.businessID = businessID
		}
		
		public var micro: Micro
		public var businessID: UUID
		
	}
}
