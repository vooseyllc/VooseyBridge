//
//  File.swift
//  
//
//  Created by Justin Means on 5/13/21.
//

import Foundation

public enum MediaType: StringLiteralType, RawRepresentable, Codable {
	static let schema = "media_type_enum"
	case profilePic
	case render
	case imageUpload
	case pdf
	case dwg
	case spatialModel
	case spatialAsset
	case spatialMaterial
	case data
	
	public var contentType: String {
		switch self {
			
			case .profilePic:
				return "image/jpeg"
			case .render:
				return "image/jpeg"
			case .imageUpload:
				return "image/jpeg"
			case .pdf:
				return "application/pdf"
			case .dwg:
				return "application/octet-stream"
			case .spatialModel:
				return "application/zip"
			case .spatialAsset:
				return "application/zip"
			case .spatialMaterial:
				return "image/jpeg"
			case .data:
				return "application/octet-stream"
		}
	}
}
