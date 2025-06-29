//
//  CategoryBarView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

final class CategoryBarView: NibView {
    
    ///
    enum CategoryType {
        case checking
        case savings
        case crypto
    }
    
    @IBOutlet weak var checkingLabel: UILabel!
    @IBOutlet weak var savingsLabel: UILabel!
    @IBOutlet weak var cryptoLabel: UILabel!
    
    @IBOutlet weak var checkingLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var savingsLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cryptoLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tabHighlighStrip: UIView!
    
    ///
    private(set) var currentSelectedType: CategoryType = .checking
    
    ///
    weak var delegate: (any CategoryBarViewDelegate)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
        setupAttributes()
    }
    
    override func setupAttributes() {
        super.setupAttributes()
        
        tabHighlighStrip.layer.cornerRadius = 2
        tabHighlighStrip.layer.masksToBounds = true
    }
    
    @IBAction func didTapCheckingButton(_ sender: Any) {
        setSelectionCategory(.checking)
        setButtonLabelTextColor(.label, .secondaryLabel, .secondaryLabel)
    }
    
    @IBAction func touchDownChckingButton(_ sender: Any) {
        setButtonLabelTextColor(.bankingGray, nil, nil)
    }
    
    @IBAction func touchUpOutsideCheckingButton(_ sender: Any) {
        if currentSelectedType == .checking {
            setButtonLabelTextColor(.label, .secondaryLabel, .secondaryLabel)
        } else {
            checkingLabel.textColor = .secondaryLabel
        }
    }
    
    @IBAction func didTapSavingButton(_ sender: Any) {
        setSelectionCategory(.savings)
        setButtonLabelTextColor(.secondaryLabel, .label, .secondaryLabel)
    }
    
    @IBAction func touchDownSavingButton(_ sender: Any) {
        setButtonLabelTextColor(nil, .bankingGray, nil)
    }
    
    @IBAction func touchUpOutsideSavingButton(_ sender: Any) {
        if currentSelectedType == .savings {
            setButtonLabelTextColor(.secondaryLabel, .label, .secondaryLabel)
        } else {
            savingsLabel.textColor = .secondaryLabel
        }
    }
    
    @IBAction func didTapCryptoButton(_ sender: Any) {
        setSelectionCategory(.crypto)
        setButtonLabelTextColor(.secondaryLabel, .secondaryLabel, .label)
    }
    
    @IBAction func touchDownCryptoButton(_ sender: Any) {
        setButtonLabelTextColor(nil, nil, .bankingGray)
    }
    
    @IBAction func touchUpOutsideCryptoButton(_ sender: Any) {
        if currentSelectedType == .crypto {
            setButtonLabelTextColor(.secondaryLabel, .secondaryLabel, .label)
        } else {
            cryptoLabel.textColor = .secondaryLabel
        }
    }
    
}

extension CategoryBarView {
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - type: <#type description#>
    ///   - animated: <#animated description#>
    func setSelectionCategory(
        _ type: CategoryBarView.CategoryType,
        animated: Bool = true
    ) {
        switch type {
        case .checking: setHighlightStripPosition(.defaultHigh, .defaultLow, .defaultLow)
        case .savings: setHighlightStripPosition(.defaultLow, .defaultHigh, .defaultLow)
        case .crypto: setHighlightStripPosition(.defaultLow, .defaultLow, .defaultHigh)
        }
        currentSelectedType = type
        delegate?.categoryBarView(self, didSelectCategory: type)
    }
    
    private func setHighlightStripPosition(
        _ checkingLeadingConstraintPrioirity: UILayoutPriority,
        _ savingsLeadingConstraintPrioirity: UILayoutPriority,
        _ cryptoLeadingConstraintPrioirity: UILayoutPriority,
        animated: Bool = true
    ) {
        checkingLeadingConstraint.priority = checkingLeadingConstraintPrioirity
        savingsLeadingConstraint.priority = savingsLeadingConstraintPrioirity
        cryptoLeadingConstraint.priority = cryptoLeadingConstraintPrioirity
        
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
    }
    
    private func setButtonLabelTextColor(
        _ checkingTextColor: UIColor?,
        _ savingsTextColor: UIColor?,
        _ cryptoTextColor: UIColor?
    ) {
        if let checking = checkingTextColor {
            checkingLabel.textColor = checking
        }
        if let savings = savingsTextColor {
            savingsLabel.textColor = savings
        }
        if let crypto = cryptoTextColor {
            cryptoLabel.textColor = crypto
        }
    }
}
