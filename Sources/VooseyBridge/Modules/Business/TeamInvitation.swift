//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/22.
//

import Foundation
import JBS

public struct TeamInvitationDetails: Codable, Hashable {
	public init(outreach: Invitation.Outreach, fromBusiness: Business.Micro, role: TeamRole) {
		self.outreach = outreach
		self.fromBusiness = fromBusiness
		self.role = role
	}
	
	public var outreach: Invitation.Outreach
	public var fromBusiness: Business.Micro
	public var role: TeamRole
}
