//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public struct MaterialGroup: AssetGroup {
	public init(category: MaterialCategory, data: [MaterialData.Micro]) {
		self.category = category
		self.data = data
	}
	
	public typealias AssociatedCategory = MaterialCategory
	public typealias AssociatedData = MaterialData.Micro
	public var category: MaterialCategory
	public var data: [MaterialData.Micro]
}
