//
//  File.swift
//  
//
//  Created by Justin Means on 5/31/21.
//

import Foundation
import CoreGraphics

public struct VooseyVector3: Codable, Hashable {
	public var x: CGFloat
	public var y: CGFloat
	public var z: CGFloat
	public init(x: CGFloat, y: CGFloat, z: CGFloat) {
		self.x = x
		self.y = y
		self.z = z
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
}
