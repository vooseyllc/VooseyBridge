//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public struct SkyboxGroup: AssetGroup {
	public init(category: SkyboxCategory, data: [SkyboxData.Micro]) {
		self.category = category
		self.data = data
	}
	
	public typealias AssociatedCategory = SkyboxCategory
	public typealias AssociatedData = SkyboxData.Micro
	public var category: SkyboxCategory
	public var data: [SkyboxData.Micro]
	
}
