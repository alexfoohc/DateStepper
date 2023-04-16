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

public enum DateType {
    case full
    case month
    case year
}

public enum ButtonIcon {
    case chevron
    case regular
}

private enum ButtonDirection {
    case left
    case right
}


public final class DateStepper: UIView {
    
    
    // MARK: - Variable declaration
    
    private lazy var rightButton = configureButtonWith(icon: buttonIcon!, direction: .right, tintColor: buttonTintColor!, tag: 1)
    private lazy var leftButton = configureButtonWith(icon: buttonIcon!, direction: .left, tintColor: buttonTintColor!, tag: 0)
    
    var delegate: CustomStepperDelegate?
    
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
        label.text = monthValue.capitalized
        label.textColor = .black
        label.font = UIFont(name: "Avenir Black", size: 17)
        return label
    }()
    
    private (set) var monthValue: String = Date().getCurrentMonth()
    private (set) var stepperType: DateType?
    private (set) var buttonIcon: ButtonIcon?
    private (set) var buttonTintColor: UIColor?
    
    
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
    
    // This is only applied at the init to get which type of label is being chosen
    private func getStepperType(dateType: DateType) -> String {
        switch dateType {
        case .full:
            monthValue = Date().showFullDate()
        case .year:
            monthValue = Date().showOnlyYear()
        default:
            monthValue = Date().getCurrentMonth()
        }
        
        return monthValue
    }
    
    

    // MARK: - Init with default parameters
    public init(stepperType: DateType?, buttonIcon: ButtonIcon?, buttonTintColor: UIColor?) {
        super.init(frame: .zero)
        self.stepperType = stepperType ?? .month
        self.buttonIcon = buttonIcon ?? .chevron
        self.buttonTintColor = buttonTintColor ?? .black
        self.monthValue = getStepperType(dateType: self.stepperType ?? .month)
        setup()
    }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Button methods
    private func configureButtonWith(icon: ButtonIcon, direction: ButtonDirection, tintColor: UIColor, tag: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        switch (icon, direction) {
        case (ButtonIcon.chevron, ButtonDirection.left):
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        case (ButtonIcon.chevron, ButtonDirection.right):
            button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        case (ButtonIcon.regular, ButtonDirection.left):
            button.setImage(UIImage(systemName: "minus"), for: .normal)
        case (ButtonIcon.regular, ButtonDirection.right):
            button.setImage(UIImage(systemName: "plus"), for: .normal)
        }
        button.tag = tag
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    @objc private func buttonTapped(_ sender: UIButton) {
        print(sender.tag)
    }
    
    private func updateLabel() {
       
    }
    
    // MARK: - Date Animations
    
    private func nextDateAnimation() {
        
    }
    
    private func previousDateAnimation() {
        
    }
    
    
    
//    private func updateValue(_ )
    
}
