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
        
        let stepper = DateStepper(stepperType: nil, buttonIcon: nil, buttonTintColor: nil)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        let constraints = [stepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
                           stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           stepper.widthAnchor.constraint(equalToConstant: 260),
                           stepper.heightAnchor.constraint(equalToConstant: 60)]
        NSLayoutConstraint.activate(constraints)
        
        
        
        // TODO: Refactor Date calculation process and add it to the correct class
        // This is the process to get the current month, convert it to int to add or substract and then convert it back to string
        // Add some methods or think a way to refactor this or find a generic way to implement this
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let month = components.month
        print(month)
        
        let myMonth = 4
        
        let myNewDateComponents = DateComponents(calendar: calendar, month: myMonth)
        let myNewDate = calendar.date(from: myNewDateComponents)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let stringDate = dateFormatter.string(from: myNewDate!)
        print(" My month was: \(stringDate)")
        
        // Do any additional setup after loading the view.
        
    }

}

