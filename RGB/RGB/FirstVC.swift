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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToRGBVC() {
        performSegue(withIdentifier: "goToRGBVC", sender: mainColor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? SecondVC,
              let editColor = sender as? Color else { return }
        destinationVC.editColor = editColor
    }
    

}
