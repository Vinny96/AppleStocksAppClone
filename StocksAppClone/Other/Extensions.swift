//
//  Extensions.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-28.
//

import Foundation
import UIKit

// MARK: - Framing Extensions
extension UIView
{
    var width : CGFloat {
        return frame.width
    }
    
    var height : CGFloat {
        return frame.height
    }
    
    var top : CGFloat {
        return frame.origin.y
    }
    
    var bottom : CGFloat {
        return top + height
    }
    
    var left : CGFloat {
        return frame.origin.x
    }
    
    var right : CGFloat {
        return left + width
    }
    
}

//MARK: - Extending UIView
extension UIView
{
    func addSubviews(viewsToAdd : UIView...)
    {
        viewsToAdd.forEach { viewToAdd in
            self.addSubview(viewToAdd)
        }
    }
}

