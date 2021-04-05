//
//  CounterClockView.swift
//  ViewpointClock
//
//  Created by kisoo Um on 2020/09/17.
//  Copyright © 2020 kisoo Um. All rights reserved.
//

import UIKit

class CounterClockView: UIView {

    private let lineWidth = CGFloat(3.0);
    private var centerPoint = CGPoint()
    
    enum TimeType {
        case sec
        case min
        case time
        
    }
    
    override func draw(_ rect: CGRect) {
        print("ClockView::draw")
        
        guard  let context = UIGraphicsGetCurrentContext() else {
            print("contest is nil")
            return
        }
        
        let p = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        
        context.saveGState()
        
        context.translateBy(x: bounds.midX, y: bounds.midY)
        context.rotate(by: .pi / -4)
        context.translateBy(x: -bounds.midX, y: -bounds.midY)
        
        context.addArc(center: p, radius: 70, startAngle: CGFloat(0) * .pi / 180 , endAngle: CGFloat(360) * .pi / 180, clockwise: false)
        
        context.setFillColor(UIColor.blue.cgColor)
        
        context.fillPath()
            
        
        context.restoreGState()
        centerPoint.x = self.bounds.size.width / 2.0
        centerPoint.y = self.bounds.size.height / 2.0
        
        
        
        drawSecond( TimeType : TimeType.sec ,context, centerPoint, Date() )
        drawMinute( TimeType : TimeType.sec ,context, centerPoint, Date() )
        drawHour( TimeType : TimeType.sec ,context, centerPoint, Date() )
    }
    func drawHour(TimeType type : TimeType  ,_ context : CGContext , _ center : CGPoint , _ date : Date ){
        
        context.saveGState()
        context.translateBy(x: center.x , y: center.y)
        
        let h = Calendar.current.component(.hour, from: date)
        let m = Calendar.current.component(.minute, from: date)
        var deg = .pi / (180) * (30.0 * CGFloat(h % 12)  )
        deg = deg
            + .pi / (180) * (0.5 * CGFloat(m))
        context.rotate(by: -deg )
        context.translateBy(x:  -center.x , y: -center.y)
        
        
        context.setLineWidth(lineWidth)
        context.move(to: center)
        context.addLine(to: CGPoint(x: center.x, y: center.y - 50))
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(CGFloat(6))
        context.strokePath()
        
        context.restoreGState()
        
        
        
    }
    func drawMinute(TimeType type : TimeType  ,_ context : CGContext , _ center : CGPoint , _ date : Date ){
        
        context.saveGState()
        context.translateBy(x: center.x , y: center.y)
        
        let m = Calendar.current.component(.minute, from: date)
        context.rotate(by: -.pi / (180) * (6.0 * CGFloat(m)))
        context.translateBy(x:  -center.x , y: -center.y)
        
        
        context.setLineWidth(lineWidth)
        context.move(to: center)
        context.addLine(to: CGPoint(x: center.x, y: center.y - 60))
        context.setStrokeColor(UIColor.gray.cgColor)
        context.setLineWidth(CGFloat(4))
        context.strokePath()
        
        context.restoreGState()
        
        
        
    }
    func drawSecond(TimeType type : TimeType  ,_ context : CGContext , _ center : CGPoint , _ date : Date ){
        
        context.saveGState()
        context.translateBy(x: center.x , y: center.y)
        
        let s = Calendar.current.component(.second, from: date)
        context.rotate(by: -.pi / (180) * (6.0 * CGFloat(s)))
        context.translateBy(x:  -center.x , y: -center.y)
        
        
        context.setLineWidth(lineWidth)
        context.move(to: center)
        context.addLine(to: CGPoint(x: center.x, y: center.y - 70))
        context.setLineWidth(CGFloat(2))
        context.strokePath()
        
        context.restoreGState()
        
        
        
    }

}
