//
//  SecondVC.swift
//  RGB
//
//  Created by Максим Капанжи on 9.08.22.
//

import UIKit

class SecondVC: UIViewController {
    var editColor: Color?
    
    @IBOutlet var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialColors()
    }
    
    @IBAction func sliderMove() {
        changeBackgroundColor()
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
        guard ((editColor?.red = redSlider.value) != nil),
              ((editColor?.green = greenSlider.value) != nil),
              ((editColor?.blue = blueSlider.value) != nil) else { return }
        
    }
    
}
