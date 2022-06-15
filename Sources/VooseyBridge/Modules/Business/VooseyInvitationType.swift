//
//  File.swift
//  
//
//  Created by Justin Means on 5/11/22.
//

import Foundation
import JBS

public extension InvitationType {
	static var team: InvitationType {
		InvitationType(rawValue: "team")
	}
	static var client: InvitationType {
		InvitationType(rawValue: "client")
	}
}
