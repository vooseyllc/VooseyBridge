//
//  File.swift
//  
//
//  Created by Justin Means on 6/14/21.
//

import Foundation
import JBSModerate

public struct Project {
	public struct Global: DomaGlobalMetaRepresentable {
		public init(officialScenes: [DomaScene.Global], userScenes: [DomaScene.Global], micro: Project.Global.Micro, team: [BusinessTeamMember.Global], clients: [User.Micro], isSaved: Bool? = nil) {
			self.officialScenes = officialScenes
			self.userScenes = userScenes
			self.micro = micro
			self.team = team
			self.clients = clients
			self.isSaved = isSaved
		}
		
		public typealias Micro = Project.Micro
		public var officialScenes: [DomaScene.Global]
		public var userScenes: [DomaScene.Global]
		public var micro: Micro
		public var id: UUID? { micro.id }
		public var team: [BusinessTeamMember.Global]
		public var clients: [User.Micro]
		public var isSaved: Bool?
	}
	
	public struct Micro: DomaMicroMetaRepresentable {
		public init(id: UUID? = nil, title: String, description: String? = nil, websiteURL: String? = nil, coordinates: String? = nil, imageURLs: [String], business: Business.Micro, tags: [String]? = nil, published: Bool, featuredImageURL: String? = nil, createdDate: Date? = nil, updatedDate: Date? = nil) {
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
		public var schema: ReportSchema { ReportSchema.project }
		public var reportMeta: ReportMetadata { ReportMetadata(title: self.title, imageURLString: self.featuredImageURL, creatorName: self.business.displayName, date: self.createdDate) }
	}
	
	public struct Create: DomaCreateMetaRepresentable {
		public var micro: Micro
		public var businessID: UUID
		public var scenes: [DomaScene.Global]
		
	}
}

public extension ReportSchema {
	static var project: ReportSchema {
		ReportSchema(rawValue: "project")
	}
}

//public struct Project {
//	public struct Global: Codable, Identifiable, Hashable {
//		public init(business: Business.Micro, team: [BusinessTeamMember.Global], clients: [User.Micro], media: [Media.Global], micro: Project.Micro) {
//			self.business = business
//			self.team = team
//			self.clients = clients
//			self.media = media
//			self.micro = micro
//		}
//		public var business: Business.Micro
//		public var team: [BusinessTeamMember.Global]
//		public var clients: [User.Micro]
//		public var media: [Media.Global]
//		public var micro: Project.Micro
//		public var id: UUID? {
//			micro.id
//		}
//	}
//
//	public struct Micro: Codable, Identifiable, Hashable {
//		public init(id: UUID? = nil, business: Business.Micro, title: String, createdDate: Date? = nil, lastUpdated: Date? = nil, coordinates: String? = nil, previewImageURL: String? = nil) {
//			self.id = id
//			self.business = business
//			self.title = title
//			self.createdDate = createdDate
//			self.lastUpdated = lastUpdated
//			self.coordinates = coordinates
//			self.previewImageURL = previewImageURL
//		}
//
//		public var id: UUID?
//		public var business: Business.Micro
//		public var title: String
//		public var createdDate: Date?
//		public var lastUpdated: Date?
//		public var coordinates: String?
//		public var previewImageURL: String?
//	}
//
//	public struct CreateData: Codable, Hashable {
//		public init(businessID: UUID, micro: Project.Micro) {
//			self.businessID = businessID
//			self.micro = micro
//		}
//
//		public var businessID: UUID
//		public var micro: Micro
//	}
//}
