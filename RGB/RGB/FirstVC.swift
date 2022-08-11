//
//  FirstVC.swift
//  RGB
//
//  Created by Максим Капанжи on 9.08.22.
//

import UIKit

class FirstVC: UIViewController {
    var mainColor = Color(red: 1, green: 1, blue: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: CGFloat(mainColor.red), green: CGFloat(mainColor.green), blue: CGFloat(mainColor.blue), alpha: 1)
    }

    @IBAction func goToRGBVC() {
        performSegue(withIdentifier: "goToRGBVC", sender: mainColor)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // вперед перешел через сегу
        if let destinationVC = segue.destination as? SecondVC,
           let editColor = sender as? Color
        {
            destinationVC.editColor = editColor
            destinationVC.delegate = self
        } else { return }
        // назначил делегатом класс
    }
}

extension FirstVC: DataUpdateProtocol { // расширил класс вот так
    func onDataUpdate(data: Color) {
        mainColor.red = data.red
        mainColor.blue = data.blue
        mainColor.green = data.green

        self.view.backgroundColor = UIColor(red: CGFloat(data.red), green: CGFloat(data.green), blue: CGFloat(data.blue), alpha: 1)
    }
}
