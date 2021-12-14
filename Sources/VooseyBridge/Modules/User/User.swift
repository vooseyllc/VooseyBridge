//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation
import JBSAuth

public struct User: Codable, Hashable {
//	public struct RegistrationData: Codable {
//		public init(username: String, email: String, firstName: String, lastName: String, name: String, password: String) {
//			self.username = username
//			self.email = email
//			self.name = name
//			self.password = password
//		}
//
//		public var username: String
//		public var email: String
//		public var name: String
//		public var password: String
//
//
//
//		public init() {
//			self.username = ""
//			self.email = ""
//			self.name = ""
//			self.password = ""
//		}
//	}
	
	public struct Global: GlobalUserRepresentable {
		public init(businessTeams: [BusinessTeamMember.Global]? = nil, micro: User.Micro, favoriteShowcases: [Showcase.Micro]?) {
			self.businessTeams = businessTeams
			self.micro = micro
			self.favoriteShowcases = favoriteShowcases
		}
		
		public var id: UUID {
			micro.id
		}
		public var businessTeams: [BusinessTeamMember.Global]?
		public var micro: Micro
		public var favoriteShowcases: [Showcase.Micro]?
	}
	
	public struct Micro: MicroUserRepresentable {
		public init(id: UUID, username: String, profilePicURL: String? = nil, firstName: String? = nil, lastName: String? = nil, name: String? = nil, websiteURL: String? = nil, createdDate: Date? = nil) {
			self.id = id
			self.username = username
			self.profilePicURL = profilePicURL
			self.name = name
			self.firstName = firstName
			self.lastName = lastName
			self.websiteURL = websiteURL
			self.createdDate = createdDate
		}
		
		public var id: UUID
		public var username: String
		public var profilePicURL: String?
		public var firstName: String?
		public var lastName: String?
		public var name: String?
		public var websiteURL: String?
		public var createdDate: Date?
	}
	
	public struct Personal: PersonalUserRepresentable {
		public var global: User.Global
		
		public typealias Global = User.Global
		
		public init(micro: User.Micro, email: String? = nil, token: String? = nil, businessTeams: [BusinessTeamMember.Personal]? = nil, projects: [Project.Global]? = nil, totalBytesUsed: Int? = nil, favoriteShowcases: [Showcase.Micro]? = nil) {
			self.micro = micro
			self.email = email
			self.token = token
			self.businessTeams = businessTeams
			self.projects = projects
			self.totalBytesUsed = totalBytesUsed
//			let bt = (self.businessTeams ?? []).map({ BusinessTeamMember.Global(id: $0.id, business: $0.business, user: $0.user, role: $0.role)}), micro: self.micro})
			let bt: [BusinessTeamMember.Global] = []
			self.global = User.Global(businessTeams: bt, micro: self.micro, favoriteShowcases: favoriteShowcases)
		}
		
		
		public var id: UUID {
			micro.id
		}
		public var micro: Micro
		public var email: String?
		public var token: String?
		public var businessTeams: [BusinessTeamMember.Personal]?
		public var projects: [Project.Global]?
		public var totalBytesUsed: Int?
	}
	
	public struct CreateData: Codable {
		public init(username: String, email: String, password: String, name: String, firstName: String, lastName: String) {
			self.username = username
			self.email = email
			self.password = password
			self.name = name
			self.firstName = firstName
			self.lastName = lastName
		}
		
		public init() {
			self.username = ""
			self.email = ""
			self.password = ""
			self.name = ""
			self.firstName = ""
			self.lastName = ""
		}
		
		public var username: String
		public var email: String
		public var password: String
		public var name: String
		public var firstName: String
		public var lastName: String
	}
	
	public struct PutData: Codable {
		public init(personal: User.Personal, password: String? = nil) {
			self.personal = personal
			self.password = password
		}
		
		public var personal: User.Personal
		public var password: String?
	}
	
//	public struct SetProfilePicData: Codable {
//		public init(user: User.Personal, putURL: String) {
//			self.user = user
//			self.putURL = putURL
//		}
//
//		public var user: Personal
//		public var putURL: String
//	}
}
