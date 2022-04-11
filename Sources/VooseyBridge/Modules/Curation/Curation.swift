//
//  File.swift
//  
//
//  Created by Justin Means on 6/21/21.
//

import Foundation
import JBSNews

public struct Curation {
	public struct Global: Codable, Hashable {
		public init(announcements: [Announcement]? = nil, dailyShowcase: KundaShowcase.Global? = nil, dailyDomaShowcase: DomaShowcase.Global?, news: [News.Global]? = nil, showcases: [KundaShowcase.Global]? = nil, businesses: [Business.Micro]? = nil, domaShowcases: [DomaShowcase.Global]? = nil, products: [Product.Global]? = nil) {
			self.announcements = announcements
			self.dailyShowcase = dailyShowcase
			self.dailyDomaShowcase = dailyDomaShowcase
			self.news = news
			self.showcases = showcases
			self.businesses = businesses
			self.domaShowcases = domaShowcases
			self.products = products
		}
		
		public var announcements: [Announcement]?
		public var dailyShowcase: KundaShowcase.Global?
		public var dailyDomaShowcase: DomaShowcase.Global?
		public var news: [News.Global]?
		public var showcases: [KundaShowcase.Global]?
		public var businesses: [Business.Micro]?
		public var domaShowcases: [DomaShowcase.Global]?
		public var products: [Product.Global]?
	}
}

