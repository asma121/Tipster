//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 09/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var persentagePlus5Label: UILabel!
    @IBOutlet weak var persentagePlus10Label: UILabel!
    
    @IBOutlet weak var amountLabel1: UILabel!
    @IBOutlet weak var amountLabel2: UILabel!
    @IBOutlet weak var amountLabel3: UILabel!
    
    @IBOutlet weak var amountPerPerson1: UILabel!
    @IBOutlet weak var amountPerPerson2: UILabel!
    @IBOutlet weak var amountPerPerson3: UILabel!
    
    var value = ""
    var percentage = 0
    var percentagePlus5 = 0
    var percentagePlus10 = 0
    var groupSize = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text
        switch buttonTitle {
        case "1" :
            value += "1"
            valueLabel.text = value
        case "2" :
            value += "2"
            valueLabel.text = value
        case "3" :
            value += "3"
            valueLabel.text = value
        case "4" :
            value += "4"
            valueLabel.text = value
        case "5" :
            value += "5"
            valueLabel.text = value
        case "6" :
            value += "6"
            valueLabel.text = value
        case "7" :
            value += "7"
            valueLabel.text = value
        case "8" :
            value += "8"
            valueLabel.text = value
        case "9" :
            value += "9"
            valueLabel.text = value
        case "0" :
            value += "0"
            valueLabel.text = value
        case "." :
            if value.contains("."){
                valueLabel.text = value
            }else{
                value += "."
                valueLabel.text = value
            }
        case "C" :
            value = ""
            valueLabel.text = "0"
        default : ()
        }
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupSize = Int(sender.value)
        let text = "Group Size : \(groupSize)"
        groupSizeLabel.text =  text

        if value != "" {
            calculatePersentage(value: value , percentage: percentage, groupSize: groupSize)
           calculatePersentagePlus5(value: value, percentage: percentagePlus5, groupSize: groupSize)
           calculatePersentagePlus10(value: value, percentage: percentagePlus10, groupSize: groupSize)
        }
    }
    
    
    @IBAction func percentageSlider(_ sender: UISlider) {
        percentage = Int(sender.value)
        percentagePlus5 = Int(sender.value) + 5
        percentagePlus10 = Int(sender.value) + 10
        percentageLabel.text = "\(percentage)%"
        persentagePlus5Label.text = "\(percentagePlus5)%"
        persentagePlus10Label.text = "\(percentagePlus10)%"
        
        if value != "" {
            calculatePersentage(value: value , percentage: percentage, groupSize: groupSize)
           calculatePersentagePlus5(value: value, percentage: percentagePlus5, groupSize: groupSize)
           calculatePersentagePlus10(value: value, percentage: percentagePlus10, groupSize: groupSize)
        }
    }
    
    func calculatePersentage(value:String ,percentage: Int , groupSize:Int){
        let tip = (Double(value)! * Double(percentage)/100)
        let valuePerPerson = (tip + Double(value)!) / Double(groupSize)
        amountLabel1.text = String(format: "%.2f", tip)
        amountPerPerson1.text = String(format: "%.2f", valuePerPerson)
    }
    
    func calculatePersentagePlus5(value:String ,percentage: Int , groupSize:Int){
        let tip = (Double(value)! * Double(percentage)/100)
        let valuePerPerson = (tip  + Double(value)!) / Double(groupSize)
        amountLabel2.text = String(format: "%.2f", tip)
        amountPerPerson2.text = String(format: "%.2f", valuePerPerson)
    }
    
    func calculatePersentagePlus10(value:String ,percentage: Int , groupSize:Int){
        let tip = (Double(value)! * Double(percentage)/100)
        let valuePerPerson = (tip  + Double(value)!) / Double(groupSize)
        amountLabel3.text = String(format: "%.2f", tip)
        amountPerPerson3.text = String(format: "%.2f", valuePerPerson)
    }
}

