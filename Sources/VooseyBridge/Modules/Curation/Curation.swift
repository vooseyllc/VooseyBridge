//
//  File.swift
//  
//
//  Created by Justin Means on 6/21/21.
//

import Foundation
import JWSNewsBridge

public struct Curation {
	public struct Global: Codable, Hashable {
		public init(announcements: [Announcement]? = nil, dailyShowcase: Showcase.Global? = nil, news: [News.Global]? = nil, showcases: [Showcase.Global]? = nil, businesses: [Business.Micro]? = nil) {
			self.announcements = announcements
			self.dailyShowcase = dailyShowcase
			self.news = news
			self.showcases = showcases
			self.businesses = businesses
		}
		
		
		public var announcements: [Announcement]?
		public var dailyShowcase: Showcase.Global?
		public var news: [News.Global]?
		public var showcases: [Showcase.Global]?
		public var businesses: [Business.Micro]?
	}
}

