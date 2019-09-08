//
//  ViewController.swift
//  Calculator App
//
//  Created by Aniya Allen on 8/30/19.
//  Copyright © 2019 Aniya Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath:Bool = false
    var operation = 0;
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true{
            resultLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
            performingMath = false
        }else{
            resultLabel.text = resultLabel.text! + String(sender.tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
            
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 18{
            previousNumber = Double(resultLabel.text!)!

            switch  sender.tag{
            case 14: //Division
                resultLabel.text = "÷"
  
            case 15:// Multiplication
                resultLabel.text = "x"
                
            case 16://Subtraction
                resultLabel.text = "-"
                
            case 17: //Addition
                resultLabel.text = "+"
       
            default:
                print("")
                
            }
            operation = sender.tag
            performingMath = true
        }
        else if(sender.tag == 18){ //when user clicks on = sign
            switch  operation{
            case 14: //Division
                resultLabel.text = String(previousNumber / numberOnScreen)
                
            case 15:// Multiplication
                resultLabel.text = String(previousNumber * numberOnScreen)
                
            case 16://Subtraction
                resultLabel.text = String(previousNumber - numberOnScreen)
                
            case 17: //Addition
                resultLabel.text =  String(previousNumber + numberOnScreen)
                
            default:
                print("")
                
            }
        }
        else if(sender.tag == 11){
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0;
            
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Changes the font of the status bar to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    


}

