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
		public init(dailyShowcase: Showcase.Micro? = nil, news: [News.Global]? = nil, showcases: [Showcase.Micro]? = nil, businesses: [Business.Micro]? = nil) {
			self.dailyShowcase = dailyShowcase
			self.news = news
			self.showcases = showcases
			self.businesses = businesses
		}
		
		
		public var dailyShowcase: Showcase.Micro?
		public var news: [News.Global]?
		public var showcases: [Showcase.Micro]?
		public var businesses: [Business.Micro]?
	}
}

