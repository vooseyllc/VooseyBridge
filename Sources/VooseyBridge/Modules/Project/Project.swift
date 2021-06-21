//
//  File.swift
//  
//
//  Created by Justin Means on 6/14/21.
//

import Foundation

public struct Project {
	public struct Global: Codable, Identifiable, Hashable {
		public init(business: Business.Micro, team: [BusinessTeamMember.Global], clients: [User.Micro], media: [Media.Global], micro: Project.Micro) {
			self.business = business
			self.team = team
			self.clients = clients
			self.media = media
			self.micro = micro
		}
		public var business: Business.Micro
		public var team: [BusinessTeamMember.Global]
		public var clients: [User.Micro]
		public var media: [Media.Global]
		public var micro: Project.Micro
		public var id: UUID? {
			micro.id
		}
	}
	
	public struct Micro: Codable, Identifiable, Hashable {
		public init(id: UUID? = nil, business: Business.Micro, title: String, createdDate: Date, lastUpdated: Date? = nil, coordinates: String? = nil, previewImageURL: String? = nil) {
			self.id = id
			self.business = business
			self.title = title
			self.createdDate = createdDate
			self.lastUpdated = lastUpdated
			self.coordinates = coordinates
			self.previewImageURL = previewImageURL
		}
		
		public var id: UUID?
		public var business: Business.Micro
		public var title: String
		public var createdDate: Date
		public var lastUpdated: Date?
		public var coordinates: String?
		public var previewImageURL: String?
	}
	
	public struct CreateData: Codable, Hashable {
		public init(businessID: UUID, micro: Project.Micro) {
			self.businessID = businessID
			self.micro = micro
		}
		
		public var businessID: UUID
		public var micro: Micro
	}
}
