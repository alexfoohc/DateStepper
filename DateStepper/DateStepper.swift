//
//  Stepper.swift
//  DateStepper
//
//  Created by Alejandro Hernandez on 15/04/23.
//

import Foundation
import UIKit

protocol CustomStepperDelegate {
    func valueChanged()
}

private enum ButtonDirection {
    case left
    case right
}


public final class DateStepper: UIView {
    
    
    // MARK: - Variable declaration
    
    private lazy var rightButton = configureButtonWith(direction: .right, tintColor: buttonTintColor!, tag: 1)
    private lazy var leftButton = configureButtonWith(direction: .left, tintColor: buttonTintColor!, tag: 0)
    
    let dateManager = DateManager()
    var delegate: CustomStepperDelegate?
    private (set) var monthValueString: String = ""
    private (set) var currentMonth: Date?
    private (set) var buttonTintColor: UIColor?
    private var currentValue: Date = Date()
    
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = monthValueString.capitalized
        label.textColor = .black
        label.font = UIFont(name: "Avenir Black", size: 17)
        return label
    }()
    
    // MARK: - Set up
    private func setup() {
        backgroundColor = .clear
        addSubview(container)
        let constraints = [container.topAnchor.constraint(equalTo: topAnchor),
                           container.leadingAnchor.constraint(equalTo: leadingAnchor),
                           container.trailingAnchor.constraint(equalTo: trailingAnchor),
                           container.bottomAnchor.constraint(equalTo: bottomAnchor)]
        NSLayoutConstraint.activate(constraints)
        [leftButton, label, rightButton].forEach(container.addArrangedSubview(_:))

    }

    // MARK: - Init with default parameters
    public init(buttonTintColor: UIColor?) {
        super.init(frame: .zero)
        self.buttonTintColor = buttonTintColor ?? .black
        self.monthValueString = dateManager.getCurrentMonthString()
//        self.currentMonth = dateManager.getCurrentMonth()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Button methods
    private func configureButtonWith(direction: ButtonDirection, tintColor: UIColor, tag: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if direction == .left {
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        }
        button.tag = tag
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    @objc private func buttonTapped(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 0:
            showPreviousMonth()
        case 1:
            showNextMonth()
        default:
            print("Hey")
        }
    }

    private func showNextMonth() {
//        let month = calendar.date(from: dateManager.getCurrentMonth())
//        print(month)
//        monthValueString = dateManager.getActualMonthValueFrom(date: <#T##Date#>)
        label.text = monthValueString
    }
    
    private func showPreviousMonth() {
        
    }
    
    // MARK: - Date Animations
    
    private func nextDateAnimation() {
        
    }
    
    private func previousDateAnimation() {
        
    }
    
    
    
//    private func updateValue(_ )
    
}
