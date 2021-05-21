//
//  Bublic.swift
//  L10-UIKit
//
//  Created by Антон Сафронов on 20.05.2021.
//

import UIKit

final class Bublic: UIView {
    
    var borderColor: UIColor = .red
    private var borderSize: CGFloat = 65

    override func draw(_ rect: CGRect) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderSize
        layer.cornerRadius = frame.width / 2
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
    
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        guard isUserInteractionEnabled else { return nil }
//        guard !isHidden else { return nil }
//        guard hittingBublic(point) else { return nil }
//
//        return super.hitTest(point, with: event)
//
//    }
//
//    func hittingBublic(_ point: CGPoint) -> Bool {
//
//    }
    
}




