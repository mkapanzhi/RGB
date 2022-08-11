//
//  SecondVC.swift
//  RGB
//
//  Created by Максим Капанжи on 9.08.22.
//

import UIKit

protocol DataUpdateProtocol: AnyObject {
    func onDataUpdate(data: Color)
}

class SecondVC: UIViewController {
    var editColor: Color? // принимает данные с первого по сеге, потом с ними работаем
    var saveData: Color? // копирую данные из editColor, если совпадают - блокирую кнопку 64 строка
    
    var delegate: DataUpdateProtocol? // тут создал делегата
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialColors()
        saveData = editColor
    }
    
    @IBAction func sliderMove() {
        changeBackgroundColor()
    }

    @IBAction func sendDataOnFirstVC(_ sender: UIButton) {
        guard let updatedData = editColor else { return }
        
        delegate?.onDataUpdate(data: updatedData) // должен передавать данные
        
        navigationController?.popViewController(animated: true) // возвращаемся на FirstVC
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
