//
//  customLoader.swift
//  customLoader
//
//  Created by Audrey Roemer on 16/09/2018.
//  Copyright © 2018 Audrey Roemer. All rights reserved.
//

import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    var viewColor: UIColor = .gray
    var setAlpha: CGFloat = 0.8
    var gifName: String = "giphy"
    
    lazy var transparentView: UIView = ClosureService.shared.create {
        $0.frame = UIScreen.main.bounds
        $0.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        $0.isUserInteractionEnabled = false
    }
    
    lazy var gifImage: UIImageView = ClosureService.shared.create {
        $0.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        $0.contentMode = .scaleAspectFit
        $0.center = transparentView.center
        $0.isUserInteractionEnabled = false
        $0.loadGif(name: gifName)
    }
    
    func showLoader() {
        self.addSubview(transparentView)
        self.transparentView.addSubview(gifImage)
        self.transparentView.bringSubview(toFront: self.gifImage)
        UIApplication.shared.keyWindow?.addSubview(transparentView)
    }
    
    func hideLoader() {
        self.transparentView.removeFromSuperview()
    }
    
}
