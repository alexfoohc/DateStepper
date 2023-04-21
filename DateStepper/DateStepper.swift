//
//  Stepper.swift
//  DateStepper
//
//  Created by Alejandro Hernandez on 15/04/23.
//

import Foundation
import UIKit

public protocol DateStepperDelegate: AnyObject {
    func valueChanged(date: Date)
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
    public weak var delegate: DateStepperDelegate?
    var showTodayButton: Bool = true
    
    private (set) var monthValueString: String = ""
    private (set) var currentMonth: Date = Date()
    private (set) var buttonTintColor: UIColor?
    private var currentValue: Date = Date()
    private (set) var labelTextColor: UIColor?
    private (set) var labelFont: String?
    
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = monthValueString.capitalized
        label.textColor = labelTextColor ?? .black
        label.font = UIFont(name: labelFont ?? "Avenir Black", size: 18)
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
                           container.bottomAnchor.constraint(equalTo: bottomAnchor),
                           leftButton.widthAnchor.constraint(equalToConstant: 60),
                           rightButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
        [leftButton, label, rightButton].forEach(container.addArrangedSubview(_:))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapToResetMonth)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        

    }

    // MARK: - Init with default parameters
    public init(buttonTintColor: UIColor?, labelTextColor: UIColor?, labelFont: String?) {
        super.init(frame: .zero)
        self.buttonTintColor = buttonTintColor ?? .black
        self.labelTextColor = labelTextColor ?? .black
        self.labelFont = labelFont ?? "Avenir Black"
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
            config.image = UIImage(systemName: "chevron.left")
            button.contentHorizontalAlignment = .center
            
        } else {
            config.image = UIImage(systemName: "chevron.right")
            button.contentHorizontalAlignment = .center
        }
        button.tag = tag
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        button.configuration = config
        return button
    }
    
    @objc private func arrowButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            currentMonth = dateManager.calculateMonth(date: currentMonth, calculation: .substract)
            updateValueWith(date: currentMonth)
            print(currentMonth)
        } else {
            currentMonth = dateManager.calculateMonth(date: currentMonth, calculation: .add)
            updateValueWith(date: currentMonth)
            print(currentMonth)
        }
    }
    
    @objc  func resetButtonTapped() {
        currentMonth = Date()
        updateValueWith(date: currentMonth)
    }
    
    private func updateValueWith(date: Date) {
        monthValueString = dateManager.getCurrentMonthString(date: date)
        label.text = monthValueString
        delegate?.valueChanged(date: currentMonth)
    }
    
}
