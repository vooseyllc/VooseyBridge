//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBSModerate

public struct Showcase2 {
	public struct Global: DomaGlobalMetaRepresentable {
		public var officialScenes: [DomaScene.Global]
		public var userScenes: [DomaScene.Global]
		public typealias Micro = Showcase2.Micro
		public var micro: Micro
		public var id: UUID? { micro.id }
		public var isSaved: Bool?
	}
	
	public struct Micro: DomaMicroMetaRepresentable {
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
		public var schema: ReportSchema { ReportSchema.showcase2 }
		public var reportMeta: ReportMetadata { ReportMetadata(title: self.title, imageURLString: self.featuredImageURL, creatorName: self.business.displayName, date: self.updatedDate) }
		
	}
}

public extension ReportSchema {
	static var showcase2: ReportSchema {
		ReportSchema(rawValue: "showcase2")
	}
}
