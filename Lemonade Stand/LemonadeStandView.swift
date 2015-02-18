//
//  LemonadeStandView.swift
//  Lemonade Stand
//
//  Created by Jonathan Ovadia on 2015/02/15.
//  Copyright (c) 2015 Jonathan Ovadia. All rights reserved.
//

import Foundation
import UIKit



//game Variables

var balance: Int = 10
var lemons: Int = 1
var iceCubes: Int = 1




class LemonadeStandView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnAction(sender: UIButton!){
        println("test")
        
        
    }
    

var addLemonsButton:UIButton! = UIButton()
    
    func setUpView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView{
       
        // set up the whole main view to the size of the screen
        var viewContainer = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        initMainView(viewContainer)
        viewContainer.backgroundColor = UIColor(patternImage: UIImage(named: "chalkboard")!)
        
        return viewContainer
    }
    

    
    func initMainView(view: UIView){
        // set up the stats view, ie showing stock and dollar amount
        let kMargin = CGFloat(10.0)
        
        let kRows = CGFloat(1.0/16.0)
        var titleLabel = UILabel()
        titleLabel.text = "Lemonade Stand"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: "Chalkduster", size: 27.0)
        titleLabel.sizeToFit()
        titleLabel.center = view.center
        titleLabel.frame.origin.y = view.bounds.origin.y + 20.0
        view.addSubview(titleLabel)
        
        var label1 = UILabel()
        label1.text = "You have: "
        label1.textColor = UIColor.redColor()
        label1.font = UIFont(name: "Chalkduster", size: 17.0)
        label1.sizeToFit()
        label1.center = CGPoint(x: view.bounds.origin.x + label1.bounds.width/2 +
            kMargin, y: view.frame.height * kRows * 2.0)
        view.addSubview(label1)
        
        var balanceLabel = UILabel()
        balanceLabel.text = ("$\(balance)")
        balanceLabel.textColor = UIColor.greenColor()
        balanceLabel.font = UIFont(name: "Chalkduster", size: 17.0)
        balanceLabel.sizeToFit()
        balanceLabel.center = CGPoint(x: view.center.x + balanceLabel.bounds.width/2.0, y: view.frame.height * kRows * 2.0)
        view.addSubview(balanceLabel)
        
        var lemonsLabel = UILabel()
        lemonsLabel.text = "\(lemons) Lemons"
        lemonsLabel.textColor = UIColor.whiteColor()
        lemonsLabel.font = UIFont(name: "Chalkduster", size: 17.0)
        lemonsLabel.sizeToFit()
        lemonsLabel.center = CGPoint(x: view.center.x + lemonsLabel.bounds.width/2.0, y: view.frame.height * kRows * 3.0)
        view.addSubview(lemonsLabel)
        
        var iceCubeLabel = UILabel()
        iceCubeLabel.text = "\(iceCubes) Ice Cubes"
        iceCubeLabel.textColor = UIColor.whiteColor()
        iceCubeLabel.font = UIFont(name: "Chalkduster", size: 17.0)
        iceCubeLabel.sizeToFit()
        iceCubeLabel.center = CGPoint(x: view.center.x + iceCubeLabel.bounds.width/2.0, y: view.frame.height * kRows * 4.0)
        view.addSubview(iceCubeLabel)
        
        var label2 = UILabel()
        label2.text = "Step1: Purchase Supplies"
        label2.textColor = UIColor.magentaColor()
        label2.font = UIFont(name: "Chalkduster", size: 17.0)
        label2.sizeToFit()
        label2.center = CGPoint(x: view.bounds.origin.x + label2.bounds.width/2 + kMargin, y: view.frame.height * kRows * 5.0)
        view.addSubview(label2)
        
        var label3 = UILabel()
        label3.text = "Lemons for $2"
        label3.textColor = UIColor.whiteColor()
        label3.font = UIFont(name: "Chalkduster", size: 17.0)
        label3.sizeToFit()
        label3.center = CGPoint(x: view.bounds.origin.x + label3.bounds.width/2 + kMargin, y: view.frame.height * kRows * 6.0)
        view.addSubview(label3)
    
        
        
        addLemonsButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addLemonsButton.setTitle(" + ", forState: UIControlState.Normal)
        addLemonsButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        addLemonsButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        addLemonsButton.sizeToFit()
        addLemonsButton.center = CGPoint(x: label3.center.x + label3.frame.width/2 + 20.0, y: label3.frame.origin.y + 13.0)
        var btnSender: Selector = "btnAction"
        addLemonsButton.addTarget(self, action: btnSender, forControlEvents: UIControlEvents.TouchUpInside)
        addLemonsButton.addTarget(self, action: "btnAction:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addLemonsButton)

    }
    

}

































