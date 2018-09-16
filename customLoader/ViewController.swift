//
//  ViewController.swift
//  customLoader
//
//  Created by Audrey Roemer on 16/09/2018.
//  Copyright © 2018 Audrey Roemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: UIButton = ClosureService.shared.create {
        $0.frame = CGRect(x: 120, y: 120, width: 200, height: 80)
        $0.backgroundColor = .green
        $0.setTitle("Test Button", for: .normal)
        $0.addTarget(self, action: #selector(self.showGif), for: .touchUpInside)
    }
    
    @objc func showGif() {
        CustomLoader.instance.showLoader()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        CustomLoader.instance.hideLoader()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

