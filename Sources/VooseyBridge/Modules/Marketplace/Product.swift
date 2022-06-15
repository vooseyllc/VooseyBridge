//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBS

public struct Product {
	public struct Micro: DomaMicroMetaRepresentable {
		public init(meta: DomaMeta, priceUSD: Float, salePriceUSD: Float?) {
			self.meta = meta
			self.priceUSD = priceUSD
			self.salePriceUSD = salePriceUSD
		}
		
		public var meta: DomaMeta
		public var schema: ReportSchema { ReportSchema.product }
		public var priceUSD: Float
		public var salePriceUSD: Float?
		public var metaMap: MetaMap.Micro {
			get {
				.product(self)
			}
			set {
				if case let .product(product) = newValue {
					self = product
				}
			}
		}
	}
	
	public struct Global: DomaGlobalMetaRepresentable {
		public init(officialScenes: [DomaScene.Global], userScenes: [DomaScene.Global], micro: Product.Micro, isSaved: Bool? = nil) {
			self.officialScenes = officialScenes
			self.userScenes = userScenes
			self.micro = micro
			self.isSaved = isSaved
		}
		
		public var officialScenes: [DomaScene.Global]
		public var userScenes: [DomaScene.Global]
		public typealias Micro = Product.Micro
		public var id: UUID? { micro.id }
		public var micro: Product.Micro
		public var isSaved: Bool?
		public var metaMap: MetaMap.Global {
			get {
				.product(self)
			}
			set {
				if case let .product(product) = newValue {
					self = product
				}
			}
		}
	}
	
	public struct Create: DomaCreateMetaRepresentable {
		public init(micro: Product.Micro, businessID: UUID, scenes: [DomaScene.Global]) {
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
	static var product: ReportSchema {
		ReportSchema(rawValue: "product")
	}
}
