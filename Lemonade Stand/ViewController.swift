//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Jonathan Ovadia on 2015/02/15.
//  Copyright (c) 2015 Jonathan Ovadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // UI variable connections
    var lemonsTextField:UITextField!
    var iceTextField:UITextField!
    var lemonsMixTextField:UITextField!
    var iceMixTextField:UITextField!
    var balanceLabel:UILabel!
    var lemonsLabel:UILabel!
    var iceCubeLabel:UILabel!
    var weatherImage:UIImageView!
    
    //game Variables
    
    var sup = Suplies(money: 10.0, lemons: 1, ice: 1)
    var price = Price()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // add main view
        var mainView = UIView(frame: CGRect(x:self.view.bounds.origin.x, y: self.view.bounds.origin.y,  width: self.view.frame.width, height: self.view.frame.height))
        mainView.backgroundColor = UIColor(patternImage: UIImage(named: "chalkboard")!)
        self.initMainView(mainView)
        self.view.addSubview(mainView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // IBActions
    
    func addLemonButtonPressed(sender: UIButton){
        var lemons:Int = Int(lemonsTextField.text.toInt()!)
        lemonsTextField.text = "\(addOne(lemons))"
    }
    
    func subtractLemonButtonPressed(sender: UIButton){
        var lemons:Int = Int(lemonsTextField.text.toInt()!)
        lemonsTextField.text = "\(subtractOne(lemons))"
    }
    
    func addIceButtonPressed(sender: UIButton){
        var ice:Int = Int(iceTextField.text.toInt()!)
        iceTextField.text = "\(addOne(ice))"
    }
    
    func subtractIceButtonPressed(sender: UIButton){
        var ice:Int = Int(iceTextField.text.toInt()!)
        iceTextField.text = "\(subtractOne(ice))"
    }
    
    func addIceToMixButtonPressed(sender: UIButton){
        var ice:Int = Int(iceMixTextField.text.toInt()!)
        iceMixTextField.text = "\(addOne(ice))"
    }
    
    func subtractIceFromMixButtonPressed(sender: UIButton){
        var ice:Int = Int(iceMixTextField.text.toInt()!)
        iceMixTextField.text = "\(subtractOne(ice))"
    }
    
    func addLemonsToMixButtonPressed(sender: UIButton){
        var lemons:Int = Int(lemonsMixTextField.text.toInt()!)
        lemonsMixTextField.text = "\(addOne(lemons))"
    }
    
    func subtractLemonsFromMixButtonPressed(sender: UIButton){
        var lemons:Int = Int(lemonsMixTextField.text.toInt()!)
        lemonsMixTextField.text = "\(subtractOne(lemons))"
    }
    
    func playGameButtonPressed(sender: UIButton!){
        playGame()
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
        
        balanceLabel = UILabel()
        balanceLabel.text = ("$\(sup.money)")
        balanceLabel.textColor = UIColor.greenColor()
        balanceLabel.font = UIFont(name: "Chalkduster", size: 17.0)
        balanceLabel.sizeToFit()
        balanceLabel.center = CGPoint(x: view.center.x + balanceLabel.bounds.width/2.0, y: view.frame.height * kRows * 2.0)
        view.addSubview(balanceLabel)
        
        
        var label11 = UILabel()
        label11.text = "Weather: "
        label11.textColor = UIColor.blackColor()
        label11.font = UIFont(name: "Chalkduster", size: 14.0)
        label11.sizeToFit()
        label11.center = CGPoint(x: view.bounds.origin.x + label11.bounds.width/2 +
            kMargin, y: view.frame.height * kRows * 3.0)
        view.addSubview(label11)
        
        weatherImage = UIImageView()
        weatherImage.frame = CGRect(x: label11.frame.origin.x + label11.frame.width + kMargin, y: view.frame.height * kRows * 3.0 - 20.0, width: 35, height: 35)
        weatherImage.image = UIImage(named: "cold")
        view.addSubview(weatherImage)
        
        lemonsLabel = UILabel()
        lemonsLabel.text = "\(sup.lemons) Lemons"
        lemonsLabel.textColor = UIColor.whiteColor()
        lemonsLabel.font = UIFont(name: "Chalkduster", size: 17.0)
        lemonsLabel.sizeToFit()
        lemonsLabel.center = CGPoint(x: view.center.x + lemonsLabel.bounds.width/2.0, y: view.frame.height * kRows * 3.0)
        view.addSubview(lemonsLabel)
        
        iceCubeLabel = UILabel()
        iceCubeLabel.text = "\(sup.ice) Ice Cubes"
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
        
        
        
        var addLemonsButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addLemonsButton.setTitle(" + ", forState: UIControlState.Normal)
        addLemonsButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        addLemonsButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        addLemonsButton.sizeToFit()
        addLemonsButton.center = CGPoint(x: label3.center.x + label3.frame.width/2 + 20.0, y:  view.frame.height * kRows * 6.0)
        addLemonsButton.addTarget(self, action: "addLemonButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addLemonsButton)
        
        
        lemonsTextField = UITextField()
        lemonsTextField.text = "00"
        lemonsTextField.textColor = UIColor.whiteColor()
        lemonsTextField.sizeToFit()
        lemonsTextField.center = CGPoint(x: addLemonsButton.center.x + addLemonsButton.frame.width/2 + 20.0, y:  view.frame.height * kRows * 6.0)
        view.addSubview(lemonsTextField)
        
        
        var subtractLemonsButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        subtractLemonsButton.setTitle(" - ", forState: UIControlState.Normal)
        subtractLemonsButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        subtractLemonsButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        subtractLemonsButton.sizeToFit()
        subtractLemonsButton.center = CGPoint(x: lemonsTextField.center.x + lemonsTextField.frame.width/2 + 20.0, y:  view.frame.height * kRows * 6.0 )
        subtractLemonsButton.addTarget(self, action: "subtractLemonButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(subtractLemonsButton)
        
        var label4 = UILabel()
        label4.text = "Ice for $2"
        label4.textColor = UIColor.whiteColor()
        label4.font = UIFont(name: "Chalkduster", size: 17.0)
        label4.sizeToFit()
        label4.frame.origin = CGPoint(x: label3.frame.origin.x, y: view.frame.height * kRows * 7.0 - label4.frame.height/2)
        view.addSubview(label4)
        
        var addIceButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addIceButton.setTitle(" + ", forState: UIControlState.Normal)
        addIceButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        addIceButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        addIceButton.sizeToFit()
        addIceButton.center = CGPoint(x: label3.center.x + label3.frame.width/2 + 20.0, y:  view.frame.height * kRows * 7.0)
        addIceButton.addTarget(self, action: "addIceButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addIceButton)
        
        
        iceTextField = UITextField()
        iceTextField.text = "00"
        iceTextField.textColor = UIColor.whiteColor()
        iceTextField.sizeToFit()
        iceTextField.center = CGPoint(x:  addLemonsButton.center.x + addLemonsButton.frame.width/2 + 20.0, y:  view.frame.height * kRows * 7.0)
        view.addSubview(iceTextField)
        
        
        var subtractIceButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        subtractIceButton.setTitle(" - ", forState: UIControlState.Normal)
        subtractIceButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        subtractIceButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        subtractIceButton.sizeToFit()
        subtractIceButton.center = CGPoint(x:lemonsTextField.center.x + lemonsTextField.frame.width/2 + 20.0, y:  view.frame.height * kRows * 7.0 )
        subtractIceButton.addTarget(self, action: "subtractIceButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(subtractIceButton)
        
        
        
        var label5 = UILabel()
        label5.text = "Step2: Mix your lemonade"
        label5.textColor = UIColor.magentaColor()
        label5.font = UIFont(name: "Chalkduster", size: 17.0)
        label5.sizeToFit()
        label5.center = CGPoint(x: view.bounds.origin.x + label5.bounds.width/2 + kMargin, y: view.frame.height * kRows * 8.0)
        view.addSubview(label5)
        
        var label6 = UILabel()
        label6.text = "Would your customers like \n more or less ice today?"
        label6.numberOfLines = 0
        label6.textColor = UIColor.whiteColor()
        label6.font = UIFont(name: "Chalkduster", size: 10.0)
        label6.sizeToFit()
        label6.center = CGPoint(x: view.bounds.origin.x + label6.bounds.width + kMargin, y: view.frame.height * kRows * 9.0 - 10.0)
        view.addSubview(label6)
        
        
        
        var label7 = UILabel()
        label7.text = "Lemons:"
        label7.textColor = UIColor.whiteColor()
        label7.font = UIFont(name: "Chalkduster", size: 17.0)
        label7.sizeToFit()
        label7.center = CGPoint(x: view.bounds.origin.x + label7.bounds.width/2 + kMargin, y: view.frame.height * kRows * 10.0 - 10.0)
        view.addSubview(label7)
        
        
        
        var addLemonsToMixButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addLemonsToMixButton.setTitle(" + ", forState: UIControlState.Normal)
        addLemonsToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        addLemonsToMixButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        addLemonsToMixButton.sizeToFit()
        addLemonsToMixButton.center = CGPoint(x: label3.center.x + label3.frame.width/2 + 20.0, y:  view.frame.height * kRows * 10.0)
        addLemonsToMixButton.addTarget(self, action: "addLemonsToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addLemonsToMixButton)
        
        
        lemonsMixTextField = UITextField()
        lemonsMixTextField.text = "00"
        lemonsMixTextField.textColor = UIColor.whiteColor()
        lemonsMixTextField.sizeToFit()
        lemonsMixTextField.center = CGPoint(x: addLemonsButton.center.x + addLemonsButton.frame.width/2 + 20.0, y:  view.frame.height * kRows * 10.0)
        view.addSubview(lemonsMixTextField)
        
        
        var subtractLemonsFromMixButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        subtractLemonsFromMixButton.setTitle(" - ", forState: UIControlState.Normal)
        subtractLemonsFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        subtractLemonsFromMixButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        subtractLemonsFromMixButton.sizeToFit()
        subtractLemonsFromMixButton.center = CGPoint(x: lemonsTextField.center.x + lemonsTextField.frame.width/2 + 20.0, y:  view.frame.height * kRows * 10.0 )
        subtractLemonsFromMixButton.addTarget(self, action: "subtractLemonsFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(subtractLemonsFromMixButton)
        
        var label8 = UILabel()
        label8.text = "Ice:"
        label8.textColor = UIColor.whiteColor()
        label8.font = UIFont(name: "Chalkduster", size: 17.0)
        label8.sizeToFit()
        label8.frame.origin = CGPoint(x: label3.frame.origin.x, y: view.frame.height * kRows * 11.0 - label4.frame.height/2)
        view.addSubview(label8)
        
        var addIceToMixButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addIceToMixButton.setTitle(" + ", forState: UIControlState.Normal)
        addIceToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        addIceToMixButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        addIceToMixButton.sizeToFit()
        addIceToMixButton.center = CGPoint(x: label3.center.x + label3.frame.width/2 + 20.0, y:  view.frame.height * kRows * 11.0)
        addIceToMixButton.addTarget(self, action: "addIceToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addIceToMixButton)
        
        
        iceMixTextField = UITextField()
        iceMixTextField.text = "00"
        iceMixTextField.textColor = UIColor.whiteColor()
        iceMixTextField.sizeToFit()
        iceMixTextField.center = CGPoint(x:  addLemonsButton.center.x + addLemonsButton.frame.width/2 + 20.0, y:  view.frame.height * kRows * 11.0)
        view.addSubview(iceMixTextField)
        
        
        var subtractIceFromMixButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        subtractIceFromMixButton.setTitle(" - ", forState: UIControlState.Normal)
        subtractIceFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        subtractIceFromMixButton.titleLabel?.font  =  UIFont(name: "Superclarendon-Bold", size: 17.0)
        subtractIceFromMixButton.sizeToFit()
        subtractIceFromMixButton.center = CGPoint(x:lemonsTextField.center.x + lemonsTextField.frame.width/2 + 20.0, y:  view.frame.height * kRows * 11.0 )
        subtractIceFromMixButton.addTarget(self, action: "subtractIceFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(subtractIceFromMixButton)
        
        
        var label9 = UILabel()
        label9.text = "Step3: Sell your brew"
        label9.textColor = UIColor.magentaColor()
        label9.font = UIFont(name: "Chalkduster", size: 17.0)
        label9.sizeToFit()
        label9.center = CGPoint(x: view.bounds.origin.x + label9.bounds.width/2 + kMargin, y: view.frame.height * kRows * 12.0)
        view.addSubview(label9)
        
        
        var label10 = UILabel()
        label10.text = "At the end of the day you will either make or \nlose money, If you don't have enough money to \npurchase new supplies you will lose the game! ! !"
        label10.numberOfLines = 0
        label10.textColor = UIColor.whiteColor()
        label10.font = UIFont(name: "Chalkduster", size: 10.0)
        label10.sizeToFit()
        label10.center = CGPoint(x: view.bounds.origin.x + label10.frame.width/2 + kMargin, y: view.frame.height * kRows * 13.0)
        view.addSubview(label10)
        
        
        var playGameButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        playGameButton.setTitle("Start Day", forState: UIControlState.Normal)
        playGameButton.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
        playGameButton.titleLabel?.font  =  UIFont(name: "Chalkduster", size: 35.0)
        playGameButton.sizeToFit()
        playGameButton.center = CGPoint(x: view.center.x, y:  view.frame.height * kRows * 14.0 + 15.0 )
        playGameButton.addTarget(self, action: "playGameButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(playGameButton)
        
    }
    
    func addOne(num: Int) -> Int{
        var number = num
        if(num < 10){
            return ++number
        }else{
            return number
        }
    }
    
    func subtractOne(num: Int) -> Int{
        var number = num
        if(num > 0){
            return --number
        }else{
            return number
        }
    }
    
    func updateView(){
        self.balanceLabel.text = "$\(sup.money)"
        self.balanceLabel.sizeToFit()
        self.lemonsLabel.text = "\(sup.lemons) Lemons"
        self.lemonsLabel.sizeToFit()
        self.iceCubeLabel.text = "\(sup.ice) Ice Cubes"
        self.iceCubeLabel.sizeToFit()
    }
    
    func showAlertWithText(header: String = "Warning", message: String){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func playGame(){
        if(self.purchaseSuplies()){
            return
        }
        let customers:Int = Int(arc4random_uniform(10 + self.simulateWeather()))
        let lemonsToMix:Int = lemonsMixTextField.text.toInt()!
        let iceToMix:Int = iceMixTextField.text.toInt()!
        let myMix:Double = Double(lemonsToMix)/Double(iceToMix)
        if(self.mixLemonade()){
            self.showAlertWithText(message: "You do not have enough suplies for the mix")
        }
        if(lemonsToMix == 0 || iceToMix == 0){
            self.showAlertWithText(message: "You need at least one lemon and one ice cube.")
            return
        }
        for i in 0...customers{
            let preferance:Double = (Double(arc4random_uniform(101))/Double(arc4random_uniform(101)))
            if(myMix + 1.5 > preferance && preferance > myMix - 1.5){
                sup.money = sup.money + 1
            }
        }
        self.updateView()
    }
    
    // add new suplies ot suplies, returns true if there is not enough money to purchase suples and false if there is
    func purchaseSuplies() -> Bool{
        let lemonsToPurch:Int = Int(lemonsTextField.text.toInt()!)
        if(sup.money >= price.lemons * Double(lemonsToPurch)){
        sup.lemons = sup.lemons + lemonsToPurch
        sup.money = sup.money - (price.lemons * Double(lemonsToPurch))
        }else{
            self.showAlertWithText(header: "Game Over", message: "You don't have enough money")
            return true
        }
        self.lemonsTextField.text = "0"
        
        
        let iceToPurch:Int = Int(iceTextField.text.toInt()!)
        if(sup.money >= price.ice * Double(iceToPurch)){
            sup.ice = sup.ice + iceToPurch
            sup.money = sup.money - (price.ice * Double(iceToPurch))
        }else{
            self.showAlertWithText(header: "Game Over", message: "You don't have enough money")
            return true
        }
        
        self.iceTextField.text = "0"
        
        self.updateView()
        return false
    }
    
    // subtracts the suplies required for mixing lemonade, returns true if there is not enough supplies and false if there is
    func mixLemonade() -> Bool{
        let lemons = lemonsMixTextField.text.toInt()!
        let ice = iceMixTextField.text.toInt()!
        if(sup.lemons < lemons || sup.ice < ice){
            return true
        }else{
            sup.lemons = sup.lemons - lemons
            sup.ice = sup.ice - ice
            return false
        }
    }
    
    // simualtes weather and returns a value that represents the affect on foot traffic
    func simulateWeather() -> Int{
        let weatherArray:[[Int]] = [[3,4,7],[-1,4,3],[-2,-4,-3]]
        let weaterType = Int(arc4random_uniform(UInt32(3)))
        let weatherSevarity = Int(arc4random_uniform(UInt32(3)))
        let weather:Int = weatherArray[weaterType][weatherSevarity]
        switch weaterType{
        case 0:
            weatherImage.image = UIImage(named: "warm")
        case 1:
            weatherImage.image = UIImage(named: "mild")
        case 2:
            weatherImage.image = UIImage(named: "cold")
        default:
            println("ERROR -> simualteWeather()")
        }
        
        return 1
    }
    
    
}


















































