//
//  ViewController.swift
//  FatTest
//
//  Created by Chris Boshoff on 2022/05/27.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculator = Calculator()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderChange(_ sender: UISlider) {
    
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
        
    }
        
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = Float(heightSlider.value)
        let weight = Float(weightSlider.value)
        
        
        calculator.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculator.getBMIValue()
            destinationVC.advice = calculator.getAdvice()
            
        }
    }


}

