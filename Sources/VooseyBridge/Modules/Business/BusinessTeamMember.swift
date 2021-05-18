//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct BusinessTeamMember {
	public struct Personal: Codable, Identifiable, Hashable {
		public init(global: BusinessTeamMember.Global) {
			self.global = global
		}
		
		public var id: UUID {
			return global.id
		}
		
		public static func == (lhs: BusinessTeamMember.Personal, rhs: BusinessTeamMember.Personal) -> Bool {
			return lhs.global == rhs.global
		}
		
		public var global: Global
	}
	
	public struct Global: Codable, Identifiable, Hashable {
		public init(id: UUID, business: Business.Micro, user: User.Micro, role: TeamRole) {
			self.id = id
			self.business = business
			self.user = user
			self.role = role
		}
		
		public static func == (lhs: BusinessTeamMember.Global, rhs: BusinessTeamMember.Global) -> Bool {
			return lhs.id == rhs.id
		}
		
		public let id: UUID
		public let business: Business.Micro
		public let user: User.Micro
		public let role: TeamRole
	}
	
}
