//
//  File.swift
//  
//
//  Created by Justin Means on 11/24/21.
//

import Foundation
import JBSAuth

public struct AuthDeviceGlobal: AuthDeviceGlobalRepresentable {
	public init(user: User.Micro, id: UUID?, system: OperatingSystem, osVersion: String, pushToken: String?, channels: [String]) {
		self.user = user
		self.id = id
		self.system = system
		self.osVersion = osVersion
		self.pushToken = pushToken
		self.channels = channels
	}
		
	public var channels: [String]
	public var id: UUID?
	public var osVersion: String
	public var pushToken: String?
	public var system: OperatingSystem
	public var user: User.Micro
	public typealias UserGlobal = User.Micro
}
