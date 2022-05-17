//
//  File.swift
//  
//
//  Created by Justin Means on 5/16/22.
//

import Foundation
import JBSAuth

public extension MessageAction {
	static var accept: MessageAction {
		MessageAction(rawValue: "accept")
	}
	static var decline: MessageAction {
		MessageAction(rawValue: "decline")
	}
}

