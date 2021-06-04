//
//  File.swift
//  
//
//  Created by Justin Means on 5/31/21.
//

import Foundation

public struct VooseyVector3: Codable, Hashable {
	public var x: CGFloat
	public var y: CGFloat
	public var z: CGFloat
	public init(x: CGFloat, y: CGFloat, z: CGFloat) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	public static var zero: VooseyVector3 {
		VooseyVector3(x: 0, y: 0, z: 0)
	}
}

public struct VooseyVector4: Codable, Hashable {
	public var x: CGFloat
	public var y: CGFloat
	public var z: CGFloat
	public var w: CGFloat
	
	public init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat) {
		self.x = x
		self.y = y
		self.z = z
		self.w = w
	}
	
	public static var zero: VooseyVector4 {
		VooseyVector4(x: 0, y: 0, z: 0, w: 0)
	}
}
