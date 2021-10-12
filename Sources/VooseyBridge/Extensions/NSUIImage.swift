//
//  File.swift
//  
//
//  Created by Justin Means on 10/10/21.
//

#if !os(Linux)
import Foundation
#if os(macOS)
import AppKit
#endif
#if os(iOS)
import UIKit
#endif

#if os(iOS)
public typealias NSUIImage = UIImage
#else
public typealias NSUIImage = NSImage
#endif
#endif
