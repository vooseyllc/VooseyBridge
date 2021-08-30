//
//  File.swift
//  File
//
//  Created by Justin Means on 8/16/21.
//

import Foundation

public protocol AssetCategory: Codable, Hashable {
	var title: String { get }
	static var schema: String { get }
}
