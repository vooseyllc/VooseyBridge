//
//  File.swift
//  
//
//  Created by Justin Means on 3/8/22.
//

import Foundation
import JBSModerate

public protocol DomaMicroMetaRepresentable: Reportable, Codable, Identifiable, Hashable {
	var id: UUID? { get set }
	var title: String { get set }
	var description: String? { get set }
	var websiteURL: String? { get set }
	var coordinates: String? { get set }
	var imageURLs: [String] { get set }
	var business: Business.Micro { get set }
	var tags: [String]? { get set }
	var published: Bool { get set }
	var featuredImageURL: String? { get set }
	var createdDate: Date? { get set }
	var updatedDate: Date? { get set }
}

public protocol DomaGlobalMetaRepresentable: Codable, Identifiable, Hashable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var officialScenes: [DomaScene.Global] { get set }
	var userScenes: [DomaScene.Global] { get set }
	var isSaved: Bool? { get set }
}

public protocol DomaCreateMetaRepresentable: Codable {
	associatedtype Micro: DomaMicroMetaRepresentable
	var micro: Micro { get set }
	var businessID: UUID { get set }
	var scenes: [DomaScene.Global] { get set }
}
