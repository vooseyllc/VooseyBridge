//
//  File.swift
//  
//
//  Created by Justin Means on 4/20/22.
//

import Foundation

public struct MetaMap {
	public enum Create: Codable, Hashable, Identifiable {
		public var id: UUID? {
			switch self {
				case.product(let product):
					return product.micro.id
				case .project(let project):
					return project.micro.id
				case .showcase(let showcase):
					return showcase.micro.id
					//				case .loading:
					//					return nil
			}
		}
		
		public var mapTitle: String {
			switch self {
				case .showcase:
					return "Showcase"
				case .project:
					return "Project"
				case .product:
					return "Product"
			}
		}
		
		public var meta: DomaMeta {
			get {
				switch self {
					case .project(let project):
						return project.micro.meta
					case .showcase(let showcase):
						return showcase.micro.meta
					case .product(let product):
						return product.micro.meta
				}
			}
			set {
				switch self {
					case .project(var project):
						project.micro.meta = newValue
						self = .project(project)
					case .showcase(var showcase):
						showcase.micro.meta = newValue
						self = .showcase(showcase)
					case .product(var product):
						product.micro.meta = newValue
						self = .product(product)
				}
			}
		}
		
		case showcase(_ showcase: DomaShowcase.Create)
		case project(_ project: Project.Create)
		case product(_ product: Product.Create)
	}
	public enum Global: Codable, Hashable, Identifiable {
		public var id: UUID? {
			switch self {
				case.product(let product):
					return product.id
				case .project(let project):
					return project.id
				case .showcase(let showcase):
					return showcase.id
//				case .loading:
//					return nil
			}
		}
		
		public var meta: DomaMeta {
			get {
				switch self {
					case .project(let project):
						return project.micro.meta
					case .showcase(let showcase):
						return showcase.micro.meta
					case .product(let product):
						return product.micro.meta
				}
			}
			set {
				switch self {
					case .project(var project):
						project.micro.meta = newValue
						self = .project(project)
					case .showcase(var showcase):
						showcase.micro.meta = newValue
						self = .showcase(showcase)
					case .product(var product):
						product.micro.meta = newValue
						self = .product(product)
				}
			}
		}
		
		case showcase(_ showcase: DomaShowcase.Global)
		case project(_ project: Project.Global)
		case product(_ product: Product.Global)
//		case loading
	}
	
	public enum Micro: Codable, Hashable, Identifiable {
		public var id: UUID? {
			switch self {
				case.product(let product):
					return product.id
				case .project(let project):
					return project.id
				case .showcase(let showcase):
					return showcase.id
//				case .loading:
//					return nil
			}
		}
		
		public var meta: DomaMeta {
			switch self {
				case .product(let product):
					return product.meta
				case .showcase(let showcase):
					return showcase.meta
				case .project(let project):
					return project.meta
//				case .loading:
//					return DomaMeta(metaType: .showcase, business: Business.Micro(displayName: ""))
			}
		}
		
		case showcase(_ showcase: DomaShowcase.Micro)
		case project(_ project: Project.Micro)
		case product(_ product: Product.Micro)
//		case loading
	}
}
