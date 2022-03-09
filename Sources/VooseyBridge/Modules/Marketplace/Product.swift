//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBSModerate

public struct Product {
	public struct Micro: DomaMicroMetaRepresentable {
		public var schema: ReportSchema { ReportSchema.product }
		public var reportMeta: ReportMetadata { ReportMetadata(title: self.title, imageURLString: nil, creatorName: self.business.displayName, date: self.createdDate) }
		public var id: UUID?
		public var scenes: [DomaScene.Global]
		public var business: Business.Micro
		public var createdDate: Date?
		public var updatedDate: Date?
		public var title: String
		public var description: String?
		public var websiteURL: String?
		public var coordinates: String?
		public var imageURLs: [String]
		public var tags: [String]?
		public var published: Bool
		public var featuredImageURL: String?
	}
	
	public struct Global: DomaGlobalMetaRepresentable {
		public var officialScenes: [DomaScene.Global]
		public var userScenes: [DomaScene.Global]
		public typealias Micro = Product.Micro
		public var id: UUID? { micro.id }
		public var micro: Product.Micro
		public var isSaved: Bool?
	}
}

public extension ReportSchema {
	static var product: ReportSchema {
		ReportSchema(rawValue: "product")
	}
}
