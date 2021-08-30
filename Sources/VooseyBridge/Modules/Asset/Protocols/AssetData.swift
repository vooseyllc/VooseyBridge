//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public protocol AssetData: Codable, Hashable, Identifiable {
	associatedtype Category: AssetCategory
	var title: String { get set }
	var imageURL: String { get set }
	var id: UUID? { get set }
	var category: Category { get set }
	var assetType: AssetType { get set }
}

public enum AssetType: StringLiteralType, RawRepresentable, Codable {
	case furniture
	case material
	case skybox
}
