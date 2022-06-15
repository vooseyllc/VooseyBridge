//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct Business {
	public struct Global: Codable, Identifiable, Hashable {
		public init(micro: Business.Micro, team: [BusinessTeamMember.Global] = [], showcases: [KundaShowcase.Global]? = nil, modelsCount: Int? = nil, scenesCount: Int? = nil, showcasesCount: Int? = nil, productsCount: Int? = nil, projectsCount: Int? = nil, teamCount: Int? = nil, clientsCount: Int? = nil, skyboxesCount: Int? = nil, materialsCount: Int? = nil, furnitureCount: Int? = nil) {
			self.micro = micro
			self.team = team
			self.showcases = showcases
			self.modelsCount = modelsCount
			self.scenesCount = scenesCount
			self.showcasesCount = showcasesCount
			self.productsCount = productsCount
			self.projectsCount = projectsCount
			self.teamCount = teamCount
			self.clientsCount = clientsCount
			self.skyboxesCount = skyboxesCount
			self.materialsCount = materialsCount
			self.furnitureCount = furnitureCount
		}
		
		
		public init(micro: Business.Micro) {
			self.micro = micro
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
		public var modelsCount: Int?
		public var scenesCount: Int?
		public var showcasesCount: Int?
		public var productsCount: Int?
		public var projectsCount: Int?
		public var teamCount: Int?
		public var clientsCount: Int?
		public var skyboxesCount: Int?
		public var materialsCount: Int?
		public var furnitureCount: Int?
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
		public init(team: [BusinessTeamMember.Personal] = [], totalBytesUsed: Int? = nil, global: Business.Global) {
			self.team = team
			self.totalBytesUsed = totalBytesUsed
			self.global = global
		}
		
		
		public static func == (lhs: Business.Personal, rhs: Business.Personal) -> Bool {
			return lhs.micro == rhs.micro && lhs.totalBytesUsed == rhs.totalBytesUsed
		}
		public var id: UUID? {
			micro.id
		}
		public var micro: Micro {
			get {
				global.micro
			}
			set {
				global.micro = newValue
			}
		}
		public var team: [BusinessTeamMember.Personal] = []
		public var totalBytesUsed: Int?
		public var global: Business.Global
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
