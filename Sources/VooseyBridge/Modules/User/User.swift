//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct User: Codable, Hashable {
	public struct RegistrationData: Codable {
		public init(username: String, email: String, firstName: String, lastName: String, password: String, profilePicURL: String?) {
			self.username = username
			self.email = email
			self.firstName = firstName
			self.lastName = lastName
			self.password = password
			self.profilePicURL = profilePicURL
		}
		
		public var username: String
		public var email: String
		public var firstName: String
		public var lastName: String
		public var password: String
		public var profilePicURL: String?
		
		
		
		public init() {
			self.username = ""
			self.email = ""
			self.firstName = ""
			self.lastName = ""
			self.password = ""
			self.profilePicURL = ""
		}
	}
	
	public struct Global: Codable, Identifiable, Hashable {
		public init(businessTeams: [BusinessTeamMember.Global]? = nil, micro: User.Micro) {
			self.businessTeams = businessTeams
			self.micro = micro
		}
		
		public var id: UUID {
			micro.id
		}
		public var businessTeams: [BusinessTeamMember.Global]?
		public var micro: Micro
	}
	
	public struct Micro: Codable, Identifiable, Hashable {
		public init(id: UUID, username: String, profilePicURL: String? = nil, firstName: String? = nil, lastName: String? = nil, websiteURL: String? = nil, createdDate: Date? = nil) {
			self.id = id
			self.username = username
			self.profilePicURL = profilePicURL
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
		public var websiteURL: String?
		public var createdDate: Date?
	}
	
	public struct Personal: Codable, Identifiable, Hashable {
		public init(micro: User.Micro, email: String? = nil, token: String? = nil, businessTeams: [BusinessTeamMember.Personal]? = nil) {
			self.micro = micro
			self.email = email
			self.token = token
			self.businessTeams = businessTeams
		}
		
		public var id: UUID {
			micro.id
		}
		public var micro: Micro
		public var email: String?
		public var token: String?
		public var businessTeams: [BusinessTeamMember.Personal]?
	}
	
	public struct CreateData: Codable {
		public init(username: String, email: String, password: String) {
			self.username = username
			self.email = email
			self.password = password
		}
		
		public var username: String
		public var email: String
		public var password: String
	}
	
	public struct SetProfilePicData: Codable {
		public init(user: User.Personal, putURL: URL) {
			self.user = user
			self.putURL = putURL
		}
		
		public var user: Personal
		public var putURL: URL
	}
}
