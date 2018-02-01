//
//  ViewController.swift
//  simple-calc
//
//  Created by Anton Zheng on 1/24/18.
//  Copyright © 2018 Anton Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    var numberOnScreen:Int = 0;
    var previousNumber:Int = 0;
    var sum:Int = 0;
    var performingMath:Bool = false;
    var operation:Int = 0;
    var fact:Bool = false;
    var count:Int = 1;
    
    @IBAction func numbers(_ sender: UIButton) {
        if(!fact) {
            if(performingMath) {
                numLabel.text = String(sender.tag-1)
                numberOnScreen = Int(numLabel.text!)!
                performingMath = false
            } else {
                numLabel.text = numLabel.text! + String(sender.tag - 1)
                numberOnScreen = Int(numLabel.text!)!
            }
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if(numLabel.text != "" && sender.tag != 16 && sender.tag != 17) {
            if (sender.tag == 11) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "+"
            } else if (sender.tag == 12) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "-"
            } else if (sender.tag == 13) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "x"
            } else if (sender.tag == 14) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "/"
            } else if (sender.tag == 15) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "%"
            } else if (sender.tag == 18) {
                count+=1
                sum = sum + Int(numLabel.text!)!
                numLabel.text = "avg"
            } else if (sender.tag == 19) {
                count+=1
                numLabel.text = "count"
            } else if (sender.tag == 20) {
                previousNumber = Int(numLabel.text!)!
                numLabel.text = "fact"
                fact = true
            }
            operation = sender.tag
            performingMath = true
        } else if(sender.tag == 17) {
            numberOnScreen = 0
            previousNumber = 0
            performingMath = false
            numLabel.text = ""
            operation = 0
        } else if(sender.tag == 16) {
            if(Int(numLabel.text!) != nil) {
                if(operation == 11){
                    numLabel.text = String(previousNumber + numberOnScreen)
                } else if(operation == 12) {
                    numLabel.text = String(previousNumber - numberOnScreen)
                } else if(operation == 13) {
                    numLabel.text = String(previousNumber * numberOnScreen)
                } else if(operation == 14) {
                    numLabel.text = String(previousNumber / numberOnScreen)
                } else if(operation == 15) {
                    numLabel.text = String(previousNumber % numberOnScreen)
                } else if(operation == 18) {
                    numLabel.text = String((sum + numberOnScreen) / count)
                    count = 1
                    sum = 0
                } else if(operation == 19) {
                    numLabel.text = String(count)
                    count = 1
                }
            }
            
            if(operation == 20) {
                numLabel.text = String(fact(numberOnScreen))
                fact = false
            }
            
            performingMath = true
        }
    }
    
    public func fact(_ num: Int) -> Int {
        if(num == 1 || num == 0) {
            return 1;
        }
        return fact(num - 1) * num
    }
    
    
    @IBOutlet weak var helloworldbtn: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

