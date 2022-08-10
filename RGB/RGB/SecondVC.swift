//
//  SecondVC.swift
//  RGB
//
//  Created by Максим Капанжи on 9.08.22.
//

import UIKit

class SecondVC: UIViewController {
    var editColor: Color?
    var saveData: Color?
    
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialColors()
        saveData = editColor!
    }
    
    @IBAction func sliderMove() {
        changeBackgroundColor()
    }
    @IBAction func sendDataOnFirstVC(_ sender: Any) {
        
    }
    
    func initialColors() {
        guard let red = editColor?.red,
              let blue = editColor?.blue,
              let green = editColor?.green else { return }
        colorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        
    }
    
    func changeBackgroundColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        guard (editColor?.red = redSlider.value) != nil,
              (editColor?.green = greenSlider.value) != nil,
              (editColor?.blue = blueSlider.value) != nil else { return }
        if saveData != editColor {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    
    
}
