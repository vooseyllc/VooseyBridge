//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public struct Media {
	public struct Global: Codable, Identifiable, Hashable {
		public init(id: UUID, filename: String, mediaURL: URL, totalBytes: Int? = nil, mediaType: MediaType) {
			self.id = id
			self.filename = filename
			self.mediaURL = mediaURL
			self.totalBytes = totalBytes
			self.mediaType = mediaType
		}
		
		public var id: UUID
		public var filename: String
		public var mediaURL: URL
		public var totalBytes: Int?
		public var mediaType: MediaType
	}
	
	public struct Personal: Codable {
		public init(putUploadRequestURL: URL? = nil, global: Media.Global) {
			self.putUploadRequestURL = putUploadRequestURL
			self.global = global
		}
		
		public var putUploadRequestURL: URL?
		public var global: Global
	}
	
	public struct UploadData: Codable {
		public init(filename: String, totalBytes: Int? = nil, businessID: UUID? = nil, projectID: UUID? = nil, mediaType: MediaType) {
			self.filename = filename
			self.totalBytes = totalBytes
			self.businessID = businessID
			self.projectID = projectID
			self.mediaType = mediaType
		}
		
		public var filename: String
		public var totalBytes: Int?
		public var businessID: UUID?
		public var projectID: UUID?
		public var mediaType: MediaType
	}
}
