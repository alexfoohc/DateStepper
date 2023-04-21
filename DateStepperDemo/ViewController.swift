//
//  ViewController.swift
//  DateStepperDemo
//
//  Created by Alejandro Hernandez on 15/04/23.
//

import UIKit
import DateStepper

class ViewController: UIViewController, DateStepperDelegate {
    func valueChanged(date: Date) {
        // Sending selected date for further processing
        print("My selected date is: \(date)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let stepper = DateStepper(buttonTintColor: nil, labelTextColor: nil, labelFont: nil)
        stepper.delegate = self
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        let constraints = [stepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
                           stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           stepper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                           stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                           stepper.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(constraints)
    }

}

