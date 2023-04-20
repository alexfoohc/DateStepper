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
    var showTodayButton: Bool = true
    
    private (set) var monthValueString: String = ""
    private (set) var currentMonth: Date = Date()
    private (set) var buttonTintColor: UIColor?
    private var currentValue: Date = Date()
    
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = monthValueString.capitalized
        label.textColor = .black
        label.font = UIFont(name: "Avenir Black", size: 17)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: - Set up
    private func setup() {
        let tapToResetMonth = UITapGestureRecognizer(target: self, action: #selector(resetButtonTapped))
        backgroundColor = .clear
        addSubview(container)
        let constraints = [container.topAnchor.constraint(equalTo: topAnchor),
                           container.leadingAnchor.constraint(equalTo: leadingAnchor),
                           container.trailingAnchor.constraint(equalTo: trailingAnchor),
                           container.bottomAnchor.constraint(equalTo: bottomAnchor)]
        NSLayoutConstraint.activate(constraints)
        [leftButton, label, rightButton].forEach(container.addArrangedSubview(_:))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapToResetMonth)

    }

    // MARK: - Init with default parameters
    public init(buttonTintColor: UIColor?) {
        super.init(frame: .zero)
        self.buttonTintColor = buttonTintColor ?? .black
        self.monthValueString = dateManager.getCurrentMonthString(date: currentMonth)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button methods
    private func configureButtonWith(direction: ButtonDirection, tintColor: UIColor, tag: Int) -> UIButton {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        if direction == .left {
//            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            config.image = UIImage(systemName: "chevron.left")
            button.contentHorizontalAlignment = .trailing
            
        } else {
//            button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            config.image = UIImage(systemName: "chevron.right")
            button.contentHorizontalAlignment = .leading
        }
        button.tag = tag
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        button.configuration = config
        return button
    }
    
    @objc private func arrowButtonTapped(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 0:
            currentMonth = dateManager.calculateMonth(date: currentMonth, calculation: .substract)
            updateValueWith(date: currentMonth)
            print(currentMonth)
        case 1:
            currentMonth = dateManager.calculateMonth(date: currentMonth, calculation: .add)
            updateValueWith(date: currentMonth)
            print(currentMonth)
        default:
            print("Hey")
        }
    }
    
    @objc  func resetButtonTapped() {
        currentMonth = Date()
        updateValueWith(date: currentMonth)
    }

    // MARK: - Date Animations
    
    private func nextDateAnimation() {
        
    }
    
    private func previousDateAnimation() {
        
    }
    
    
    
    private func updateValueWith(date: Date) {
        monthValueString = dateManager.getCurrentMonthString(date: date)
        label.text = monthValueString
    }
    
}
