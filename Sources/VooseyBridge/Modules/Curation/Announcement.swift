//
//  File.swift
//  
//
//  Created by Justin Means on 9/18/21.
//

import Foundation

public struct Announcement: Codable, Identifiable, Equatable, Hashable {
	public init(id: UUID? = nil, title: String, subtitle: String, markdown: String? = nil, createdDate: Date? = nil, imageURL: String, linkURL: String? = nil) {
		self.id = id
		self.title = title
		self.subtitle = subtitle
		self.markdown = markdown
		self.createdDate = createdDate
		self.imageURL = imageURL
		self.linkURL = linkURL
	}
	
	public var id: UUID?
	public var title: String
	public var subtitle: String
	public var markdown: String?
	public var createdDate: Date?
	public var imageURL: String
	public var linkURL: String?
}
