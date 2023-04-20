//
//  ViewController.swift
//  DateStepperDemo
//
//  Created by Alejandro Hernandez on 15/04/23.
//

import UIKit
import DateStepper
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stepper = DateStepper(buttonTintColor: nil)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        let constraints = [stepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
                           stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           stepper.widthAnchor.constraint(equalToConstant: 360),
                           stepper.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(constraints)
    }

}

