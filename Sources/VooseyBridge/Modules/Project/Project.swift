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
		public var metaMap: MetaMap.Global {
			get {
				.project(self)
			}
			set {
				if case let .project(project) = newValue {
					self = project
				}
			}
		}
	}
	
	public struct Micro: DomaMicroMetaRepresentable {
		public init(meta: DomaMeta) {
			self.meta = meta
		}
		
		public var meta: DomaMeta
		public var schema: ReportSchema { ReportSchema.project }
		public var metaMap: MetaMap.Micro {
			get {
				.project(self)
			}
			set {
				if case let .project(project) = newValue {
					self = project
				}
			}
		}
	}
	
	public struct Create: DomaCreateMetaRepresentable {
		public init(micro: Project.Micro, businessID: UUID, scenes: [DomaScene.Global]) {
			self.micro = micro
			self.businessID = businessID
			self.scenes = scenes
		}
		
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
