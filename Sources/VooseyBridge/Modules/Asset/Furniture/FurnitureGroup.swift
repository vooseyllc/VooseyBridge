//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public struct FurnitureGroup: AssetGroup {
	public init(category: FurnitureCategory, data: [FurnitureData.Micro]) {
		self.category = category
		self.data = data
	}
	
	public typealias AssociatedData = FurnitureData.Micro
	public typealias AssociatedCategory = FurnitureCategory
	public var category: FurnitureCategory
	public var data: [FurnitureData.Micro]
	
}
