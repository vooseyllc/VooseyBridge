//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBSModerate
import JBSCore

public struct DomaScene {
	public struct Micro: Reportable, Codable, Identifiable, Hashable {
		public init(id: UUID? = nil, title: String? = nil, creator: User.Micro? = nil, business: Business.Micro? = nil, createdDate: Date? = nil, updatedDate: Date? = nil, pdfURL: String? = nil, published: Bool, featuredImageURL: String? = nil) {
			self.id = id
			self.title = title
			self.creator = creator
			self.business = business
			self.createdDate = createdDate
			self.updatedDate = updatedDate
			self.pdfURL = pdfURL
			self.published = published
			self.featuredImageURL = featuredImageURL
		}
		
		public var schema: ReportSchema { ReportSchema.scene }
		
		public var reportMeta: ReportMetadata { ReportMetadata(title: title, imageURLString: nil, creatorName: creator?.username ?? business?.displayName, date: updatedDate) }
		
		public var id: UUID?
		public var title: String?
		public var creator: User.Micro?
		public var business: Business.Micro?
		public var createdDate: Date?
		public var updatedDate: Date?
		public var pdfURL: String?
		public var published: Bool
		public var featuredImageURL: String?
	}
	
	public struct Global: Reportable, Codable, Identifiable, Hashable {
		public init(micro: DomaScene.Micro, tour: [TourItem], model: Doma.Micro, showcase: DomaShowcase.Micro? = nil, project: Project.Micro? = nil, product: Product.Micro? = nil) {
			self.micro = micro
			self.tour = tour
			self.model = model
			self.showcase = showcase
			self.project = project
			self.product = product
		}
		
//		public init(id: UUID? = nil, title: String? = nil, tour: [TourItem], model: Doma.Micro, showcase: DomaShowcase.Micro? = nil, project: Project.Micro? = nil, product: Product.Micro? = nil, creator: User.Micro? = nil, business: Business.Micro? = nil, createdDate: Date? = nil, updatedDate: Date? = nil, pdfURL: String? = nil, published: Bool, featuredImageURL: String? = nil) {
//			self.id = id
//			self.title = title
//			self.tour = tour
//			self.model = model
//			self.showcase = showcase
//			self.project = project
//			self.product = product
//			self.creator = creator
//			self.business = business
//			self.createdDate = createdDate
//			self.updatedDate = updatedDate
//			self.pdfURL = pdfURL
//			self.published = published
//			self.featuredImageURL = featuredImageURL
//		}
		public var reportMeta: ReportMetadata { micro.reportMeta }
		public var schema: ReportSchema { micro.schema }
		
		public var id: UUID? { micro.id }
		public var micro: Micro
//		public var title: String?
		public var tour: [TourItem]
		public var model: Doma.Micro
		public var showcase: DomaShowcase.Micro?
		public var project: Project.Micro?
		public var product: Product.Micro?
//		public var creator: User.Micro?
//		public var business: Business.Micro?
//		public var createdDate: Date?
//		public var updatedDate: Date?
//		public var pdfURL: String?
//		public var published: Bool
//		public var featuredImageURL: String?
	}
	
	public struct Create: Codable, Hashable {
		public init(global: DomaScene.Global, businessID: UUID? = nil, userID: UUID? = nil) {
			self.global = global
			self.businessID = businessID
			self.userID = userID
		}
		
		public var global: DomaScene.Global
		public var businessID: UUID?
		public var userID: UUID?
		#if os(iOS) || os(macOS)
		@NonCodable public var localFeaturedImage: NSUIImage?
		#endif
		
		enum CodingKeys: String, CodingKey {
			case global
			case businessID
			case userID
		}
		
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.global = try container.decode(DomaScene.Global.self, forKey: .global)
			self.businessID = try container.decodeIfPresent(UUID.self, forKey: .businessID)
			self.userID = try container.decodeIfPresent(UUID.self, forKey: .userID)
		}
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(global, forKey: .global)
			try container.encodeIfPresent(businessID, forKey: .businessID)
			try container.encodeIfPresent(userID, forKey: .userID)
		}
	}
	
}

public extension ReportSchema {
	static var scene: ReportSchema {
		ReportSchema(rawValue: "scene")
	}
}
