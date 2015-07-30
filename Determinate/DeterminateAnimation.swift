//
//  DeterminateAnimation.swift
//  ProgressKit
//
//  Created by Kauntey Suryawanshi on 09/07/15.
//  Copyright (c) 2015 Kauntey Suryawanshi. All rights reserved.
//

import Foundation
import Cocoa

protocol Determinable {
    func updateProgress()
    func progressComplete()
}

@IBDesignable
class DeterminateAnimation: NSView, Determinable {
    
    @IBInspectable var animated: Bool = true
    @IBInspectable var removeOnComplete: Bool = true

    /// Value of progress now. Range 0..1
    @IBInspectable var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }

    /// This function will only be called by didSet of progress. Every subclass will have its own implementation
    func updateProgress() {
        
        if progress < 1.0 {
            if self.hidden { self.hidden = false }
        } else {
            self.hidden = true
        }
    }
    
    func progressComplete() {
        fatalError("To be implemented in sub class")
    }
}
