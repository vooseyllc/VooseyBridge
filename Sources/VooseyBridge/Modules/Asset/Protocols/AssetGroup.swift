//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public protocol AssetGroup: Codable, Hashable {
	associatedtype AssociatedCategory: AssetCategory
	associatedtype AssociatedData: AssetData
	var category: AssociatedCategory { get set }
	var data: [AssociatedData] { get set }
}
