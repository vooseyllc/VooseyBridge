//
//  File.swift
//  
//
//  Created by Justin Means on 6/28/22.
//

import Foundation

public struct MaterialOverrideData: Codable, Equatable, Hashable {
	public init(map: MaterialOverrideData.Map, transform: MaterialOverrideData.Transform) {
		self.map = map
		self.transform = transform
	}
	
	public var map: Map
	public var transform: Transform
	
	public enum Map: Codable, Equatable, Hashable {
		case materialData(_ data: MaterialData.Micro)
		case model(_ data: MaterialData.Micro)
		
		public var data: MaterialData.Micro {
			switch self {
				case .materialData(let data):
					return data
				case .model(let data):
					return data
			}
		}
	}
	
	public struct Transform: Codable, Equatable, Hashable {
		public init(uniformScale: Bool, scaleAmount: CGFloat, scaleSize: CGSize, rotationRadians: CGFloat) {
			self.uniformScale = uniformScale
			self.scaleAmount = scaleAmount
			self.scaleSize = scaleSize
			self.rotationRadians = rotationRadians
		}
		
		public var uniformScale: Bool
		public var scaleAmount: CGFloat
		public var scaleSize: CGSize
		public var rotationRadians: CGFloat
		
		public static var zero: Transform {
			Transform(uniformScale: true, scaleAmount: 1, scaleSize: CGSize(width: 1, height: 1), rotationRadians: 0)
		}
	}
}

public typealias MaterialOverrides = [String: MaterialOverrideData]

public struct MaterialOverride: Codable, Hashable, Equatable {
	public init(key: String, value: MaterialOverrideData) {
		self.key = key
		self.value = value
	}
	
	public var key: String
	public var value: MaterialOverrideData
}

extension CGSize: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.height)
		hasher.combine(self.width)
		hasher.finalize()
	}
}
