//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBS

public struct DomaShowcase {
	public struct Global: DomaGlobalMetaRepresentable {
		public init(officialScenes: [DomaScene.Global], userScenes: [DomaScene.Global], micro: DomaShowcase.Global.Micro, isSaved: Bool? = nil) {
			self.officialScenes = officialScenes
			self.userScenes = userScenes
			self.micro = micro
			self.isSaved = isSaved
		}
		
		public var officialScenes: [DomaScene.Global]
		public var userScenes: [DomaScene.Global]
		public typealias Micro = DomaShowcase.Micro
		public var micro: Micro
		public var id: UUID? { micro.id }
		public var isSaved: Bool?
		public var metaMap: MetaMap.Global {
			get {
				.showcase(self)
			}
			set {
				if case let .showcase(showcase) = newValue {
					self = showcase
				}
			}
		}
	}
	
	public struct Micro: DomaMicroMetaRepresentable {
		public init(meta: DomaMeta) {
			self.meta = meta
		}
		
		public var meta: DomaMeta
		public var schema: ReportSchema { ReportSchema.showcase2 }
		public var reportMeta: ReportMetadata { ReportMetadata(title: self.meta.title, imageURLString: self.meta.featuredImageURL, creatorName: self.meta.business.displayName, date: self.meta.updatedDate) }
		public var metaMap: MetaMap.Micro {
			get {
				.showcase(self)
			}
			set {
				if case let .showcase(showcase) = newValue {
					self = showcase
				}
			}
		}
		
	}
	
	public struct Create: DomaCreateMetaRepresentable {
		public init(micro: DomaShowcase.Micro, businessID: UUID, scenes: [DomaScene.Global]) {
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
	static var showcase2: ReportSchema {
		ReportSchema(rawValue: "showcase2")
	}
}
