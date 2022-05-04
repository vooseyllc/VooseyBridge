//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct Business {
	public struct Global: Codable, Identifiable, Hashable {
		public init(micro: Business.Micro) {
			self.micro = micro
		}
		
		public init(micro: Business.Micro, team: [BusinessTeamMember.Global], showcases: [KundaShowcase.Global]? = nil, domaShowcases: [DomaShowcase.Global]? = nil, products: [Product.Global]? = nil) {
			self.micro = micro
			self.team = team
			self.showcases = showcases
			self.domaShowcases = domaShowcases
			self.products = products
		}
		
		public var id: UUID? {
			micro.id
		}
		public static func == (lhs: Business.Global, rhs: Business.Global) -> Bool {
			return lhs.micro == rhs.micro
		}
		public var micro: Micro
		public var team: [BusinessTeamMember.Global] = []
		public var showcases: [KundaShowcase.Global]?
		public var domaShowcases: [DomaShowcase.Global]?
		public var products: [Product.Global]?
	}
	
	public struct Micro: Codable, Identifiable, Hashable, RawRepresentable {
		public init(id: UUID? = nil, displayName: String, websiteURL: String? = nil, profilePicURL: String? = nil, description: String? = nil, legalName: String? = nil, address: String? = nil, coordinates: String? = nil) {
			self.id = id
			self.displayName = displayName
			self.websiteURL = websiteURL
			self.profilePicURL = profilePicURL
			self.description = description
			self.legalName = legalName
			self.address = address
			self.coordinates = coordinates
		}
		
		public init?(rawValue: Data) {
			if let value = try? JSONDecoder().decode(Business.Micro.self, from: rawValue) {
				self.init(micro: value)
			} else {
				return nil
			}
			
		}
		
		init(micro: Business.Micro) {
			self = micro
		}
		
		public var rawValue: Data {
			let data = try? JSONEncoder().encode(self)
			return data ?? Data()
		}
		
		public typealias RawValue = Data
		public var id: UUID?
		public var displayName: String
		public var websiteURL: String?
		public var profilePicURL: String?
		public var description: String?
		public var legalName: String?
		public var address: String?
		public var coordinates: String?
	}
	
	public struct Personal: Codable, Identifiable, Hashable {
		public init(micro: Business.Micro, totalBytesUsed: Int? = nil) {
			self.micro = micro
			self.totalBytesUsed = totalBytesUsed
		}
		
		public init(micro: Business.Micro, team: [BusinessTeamMember.Personal], showcases: [KundaShowcase.Global]? = nil, domaShowcases: [DomaShowcase.Global]? = nil, projects: [Project.Global]? = nil, products: [Product.Global]? = nil, scenes: [DomaScene.Global]? = nil, models: [Doma.Micro]? = nil, totalBytesUsed: Int? = nil) {
			self.micro = micro
			self.team = team
			self.showcases = showcases
			self.domaShowcases = domaShowcases
			self.projects = projects
			self.products = products
			self.scenes = scenes
			self.models = models
			self.totalBytesUsed = totalBytesUsed
		}
		
		public static func == (lhs: Business.Personal, rhs: Business.Personal) -> Bool {
			return lhs.micro == rhs.micro && lhs.totalBytesUsed == rhs.totalBytesUsed
		}
		public var id: UUID? {
			micro.id
		}
		public var micro: Micro
		public var team: [BusinessTeamMember.Personal] = []
		public var showcases: [KundaShowcase.Global]?
		public var domaShowcases: [DomaShowcase.Global]?
		public var projects: [Project.Global]?
		public var products: [Product.Global]?
		public var scenes: [DomaScene.Global]?
		public var models: [Doma.Micro]?
//		public var clients: [Client]
		public var totalBytesUsed: Int?
		
		public var global: Business.Global {
			return  Business.Global(micro: self.micro)
		}
	}
	
	public struct CreateData: Codable {
		public init(displayName: String, websiteURL: String? = nil, profilePicURL: String? = nil, description: String? = nil, legalName: String? = nil, address: String? = nil, coordinates: String? = nil) {
			self.displayName = displayName
			self.websiteURL = websiteURL
			self.profilePicURL = profilePicURL
			self.description = description
			self.legalName = legalName
			self.address = address
			self.coordinates = coordinates
		}
		
		public init() {
			self.displayName = ""
			self.websiteURL = nil
			self.profilePicURL = nil
			self.description = nil
			self.legalName = nil
			self.address = nil
			self.coordinates = nil
		}
		
		public var displayName: String
		public var websiteURL: String?
		public var profilePicURL: String?
		public var description: String?
		public var legalName: String?
		public var address: String?
		public var coordinates: String?
	}
}
