//
//  ProgressBar.swift
//  ProgressKit
//
//  Created by Kauntey Suryawanshi on 31/07/15.
//  Copyright (c) 2015 Kauntey Suryawanshi. All rights reserved.
//

import Foundation
import Cocoa

@IBDesignable
class ProgressBar: DeterminateAnimation {

    var backgroundLayer = CAShapeLayer()
    var borderLayer = CAShapeLayer()
    var progressLayer = CAShapeLayer()
    var percentLabelLayer = CATextLayer()

    @IBInspectable var borderColor: NSColor = NSColor.blackColor() {
        didSet {
            borderLayer.borderColor = borderColor.CGColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = CGFloat(1.0) {
        didSet {
            makeLayers()
        }
    }

    @IBInspectable var borderOffset: CGFloat = CGFloat(3.0) {
        didSet {
            makeLayers()
        }
    }

    
    @IBInspectable var progressColor: NSColor = NSColor ( red: 0.2676, green: 0.5006, blue: 0.8318, alpha: 1.0 ) {
        didSet {
            makeLayers()
        }
    }

    @IBInspectable var showPercent: Bool = true {
        didSet {
            makeLayers()
        }
    }

    @IBInspectable var percentColor: NSColor = NSColor ( red: 0.2676, green: 0.5006, blue: 0.8318, alpha: 1.0 ) {
        didSet {
            makeLayers()
        }
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.wantsLayer = true
        makeLayers()
    }
    
    func makeLayers() {
        
        let rect = self.bounds
        backgroundLayer.frame = rect
        self.layer!.addSublayer(backgroundLayer)

        borderLayer.frame = rect
        borderLayer.cornerRadius = borderLayer.frame.height / 2
        borderLayer.borderWidth = borderWidth
        backgroundLayer.addSublayer(borderLayer)

        progressLayer.frame = NSInsetRect(borderLayer.bounds, borderOffset, borderOffset)
        progressLayer.frame.size.width = (borderLayer.bounds.width - (borderOffset * 2)) * progress
        progressLayer.cornerRadius = progressLayer.frame.height / 2
        progressLayer.backgroundColor = progressColor.CGColor
        borderLayer.addSublayer(progressLayer)

        if showPercent {
            percentLabelLayer.string = "0%"
            percentLabelLayer.foregroundColor = percentColor.CGColor
            percentLabelLayer.frame = borderLayer.frame
            percentLabelLayer.bounds.size.width -= 10
            percentLabelLayer.font = NSFont(name: "Helvetica Neue Light", size: 12)
            percentLabelLayer.alignmentMode = kCAAlignmentRight
            percentLabelLayer.position.y = rect.midY - borderOffset / 2
            percentLabelLayer.fontSize = progressLayer.bounds.height
            borderLayer.addSublayer(percentLabelLayer)
        } else {
            percentLabelLayer.removeFromSuperlayer()
        }
    }
    
    override func updateProgress() {
        CATransaction.begin()
        if animated {
            CATransaction.setAnimationDuration(0.5)
        } else {
            CATransaction.setDisableActions(true)
        }
        let timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        CATransaction.setAnimationTimingFunction(timing)
        progressLayer.frame.size.width = (borderLayer.bounds.width - (borderOffset * 2)) * progress
        percentLabelLayer.string = "\(Int(progress * 100))%"
        CATransaction.commit()
    }
}