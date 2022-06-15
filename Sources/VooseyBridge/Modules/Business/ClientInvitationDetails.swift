//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/22.
//

import Foundation
import JBS

public struct ClientInvitationDetails: Codable, Hashable {
	public init(outreach: Invitation.Outreach, fromBusiness: Business.Micro) {
		self.outreach = outreach
		self.fromBusiness = fromBusiness
	}
	
	public var outreach: Invitation.Outreach
	public var fromBusiness: Business.Micro
}
