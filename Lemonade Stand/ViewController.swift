//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Jonathan Ovadia on 2015/02/15.
//  Copyright (c) 2015 Jonathan Ovadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // add main view
        var mainView = LemonadeStandView()
        self.view.addSubview(mainView.setUpView(self.view.bounds.origin.x, y: self.view.bounds.origin.y, width: self.view.frame.width, height: self.view.frame.height))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

