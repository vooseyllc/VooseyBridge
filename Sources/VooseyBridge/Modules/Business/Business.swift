//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct Business {
	public struct Global: Codable, Identifiable, Hashable {
		public init(micro: Business.Micro, team: [BusinessTeamMember.Global]) {
			self.micro = micro
			self.team = team
		}
		
		public var id: UUID? {
			micro.id
		}
		public static func == (lhs: Business.Global, rhs: Business.Global) -> Bool {
			return lhs.micro == rhs.micro
		}
		public var micro: Micro
		public var team: [BusinessTeamMember.Global]
	}
	
	public struct Micro: Codable, Identifiable, Hashable {
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
		public init(micro: Business.Micro, team: [BusinessTeamMember.Personal]) {
			self.micro = micro
			self.team = team
		}
		
		public static func == (lhs: Business.Personal, rhs: Business.Personal) -> Bool {
			return lhs.micro == rhs.micro
		}
		public var id: UUID? {
			micro.id
		}
		public var micro: Micro
		public var team: [BusinessTeamMember.Personal]
		
		public var global: Business.Global {
			return  Business.Global(micro: self.micro, team: self.team.map({ $0.global }))
		}
	}
	
	public struct CreateBusinessData: Codable {
		public init(displayName: String, websiteURL: String? = nil, profilePicURL: String? = nil, description: String? = nil, legalName: String? = nil, address: String? = nil, coordinates: String? = nil) {
			self.displayName = displayName
			self.websiteURL = websiteURL
			self.profilePicURL = profilePicURL
			self.description = description
			self.legalName = legalName
			self.address = address
			self.coordinates = coordinates
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
