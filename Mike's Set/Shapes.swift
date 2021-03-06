//
//  Shapes.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-23.
//  Copyright © 2020 Computer Inspirations. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class Shapes : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCanvas1(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 568, height: 281), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 568, height: 281), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 568, y: resizedFrame.height / 281)



        //// Image Declarations
        let setgamecards = UIImage(named: "setgamecards.png")!

        //// Picture Drawing
        let picturePath = UIBezierPath()
        picturePath.move(to: CGPoint(x: -1, y: 285))
        picturePath.addLine(to: CGPoint(x: 567, y: 285))
        picturePath.addLine(to: CGPoint(x: 567, y: 4))
        picturePath.addLine(to: CGPoint(x: -1, y: 4))
        picturePath.addLine(to: CGPoint(x: -1, y: 285))
        picturePath.close()
        context.saveGState()
        picturePath.addClip()
        context.translateBy(x: -1, y: 4)
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -setgamecards.size.height)
        context.draw(setgamecards.cgImage!, in: CGRect(x: 0, y: 0, width: setgamecards.size.width, height: setgamecards.size.height))
        context.restoreGState()


        //// Bezier Drawing
        //CGRect(x: 0, y: 0, width: 568, height: 281),
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 233.5, y: 120.5))
        bezierPath.addCurve(to: CGPoint(x: 247.5, y: 87.5), controlPoint1: CGPoint(x: 233.5, y: 120.5), controlPoint2: CGPoint(x: 227.5, y: 100.5))
        bezierPath.addCurve(to: CGPoint(x: 275.5, y: 87.5), controlPoint1: CGPoint(x: 253.59, y: 83.54), controlPoint2: CGPoint(x: 270.68, y: 85.75))
        bezierPath.addCurve(to: CGPoint(x: 292.5, y: 94.5), controlPoint1: CGPoint(x: 286.5, y: 91.5), controlPoint2: CGPoint(x: 287.63, y: 94.5))
        bezierPath.addCurve(to: CGPoint(x: 309.5, y: 91.5), controlPoint1: CGPoint(x: 296.07, y: 94.5), controlPoint2: CGPoint(x: 302.76, y: 94.56))
        bezierPath.addCurve(to: CGPoint(x: 325.5, y: 82.5), controlPoint1: CGPoint(x: 315.99, y: 88.56), controlPoint2: CGPoint(x: 322.56, y: 82.5))
        bezierPath.addCurve(to: CGPoint(x: 334.5, y: 101.5), controlPoint1: CGPoint(x: 331.5, y: 82.5), controlPoint2: CGPoint(x: 337.5, y: 93.5))
        bezierPath.addCurve(to: CGPoint(x: 308.5, y: 128.5), controlPoint1: CGPoint(x: 331.5, y: 109.5), controlPoint2: CGPoint(x: 330.5, y: 120.5))
        bezierPath.addCurve(to: CGPoint(x: 295.5, y: 128.5), controlPoint1: CGPoint(x: 303.1, y: 130.46), controlPoint2: CGPoint(x: 299.02, y: 128.3))
        bezierPath.addCurve(to: CGPoint(x: 280.5, y: 123.5), controlPoint1: CGPoint(x: 292.21, y: 128.69), controlPoint2: CGPoint(x: 280.5, y: 123.5))
        bezierPath.addCurve(to: CGPoint(x: 251.5, y: 129.5), controlPoint1: CGPoint(x: 280.5, y: 123.5), controlPoint2: CGPoint(x: 265.5, y: 117.5))
        bezierPath.addCurve(to: CGPoint(x: 237.5, y: 131.5), controlPoint1: CGPoint(x: 246.38, y: 133.89), controlPoint2: CGPoint(x: 239.56, y: 133.8))
        bezierPath.addCurve(to: CGPoint(x: 233.5, y: 119.5), controlPoint1: CGPoint(x: 233.92, y: 127.5), controlPoint2: CGPoint(x: 233.5, y: 119.5))
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawSquiggle(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 107, height: 56), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 107, height: 56), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 107, y: resizedFrame.height / 56)


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 17.5, y: 7.5))
        bezierPath.addCurve(to: CGPoint(x: 45.5, y: 7.5), controlPoint1: CGPoint(x: 23.59, y: 3.54), controlPoint2: CGPoint(x: 40.68, y: 5.75))
        bezierPath.addCurve(to: CGPoint(x: 62.5, y: 14.5), controlPoint1: CGPoint(x: 56.5, y: 11.5), controlPoint2: CGPoint(x: 57.63, y: 14.5))
        bezierPath.addCurve(to: CGPoint(x: 79.5, y: 11.5), controlPoint1: CGPoint(x: 66.07, y: 14.5), controlPoint2: CGPoint(x: 72.76, y: 14.56))
        bezierPath.addCurve(to: CGPoint(x: 95.5, y: 2.5), controlPoint1: CGPoint(x: 85.99, y: 8.56), controlPoint2: CGPoint(x: 92.56, y: 2.5))
        bezierPath.addCurve(to: CGPoint(x: 104.5, y: 21.5), controlPoint1: CGPoint(x: 101.5, y: 2.5), controlPoint2: CGPoint(x: 107.5, y: 13.5))
        bezierPath.addCurve(to: CGPoint(x: 78.5, y: 48.5), controlPoint1: CGPoint(x: 101.5, y: 29.5), controlPoint2: CGPoint(x: 100.5, y: 40.5))
        bezierPath.addCurve(to: CGPoint(x: 62.5, y: 48.5), controlPoint1: CGPoint(x: 73.1, y: 50.46), controlPoint2: CGPoint(x: 67.5, y: 49.5))
        bezierPath.addCurve(to: CGPoint(x: 50.5, y: 43.5), controlPoint1: CGPoint(x: 57.83, y: 47.57), controlPoint2: CGPoint(x: 50.5, y: 43.5))
        bezierPath.addCurve(to: CGPoint(x: 21.5, y: 49.5), controlPoint1: CGPoint(x: 50.5, y: 43.5), controlPoint2: CGPoint(x: 35.5, y: 37.5))
        bezierPath.addCurve(to: CGPoint(x: 7.5, y: 51.5), controlPoint1: CGPoint(x: 16.38, y: 53.89), controlPoint2: CGPoint(x: 9.56, y: 53.8))
        bezierPath.addCurve(to: CGPoint(x: 3.5, y: 39.5), controlPoint1: CGPoint(x: 3.92, y: 47.5), controlPoint2: CGPoint(x: 3.5, y: 39.5))
        bezierPath.addCurve(to: CGPoint(x: 17.5, y: 7.5), controlPoint1: CGPoint(x: 3.5, y: 39.5), controlPoint2: CGPoint(x: -2.5, y: 20.5))
        bezierPath.close()
        UIColor.gray.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        context.restoreGState()

    }




    @objc(ShapesResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
