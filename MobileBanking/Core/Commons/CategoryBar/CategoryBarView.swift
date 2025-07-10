//
//  CategoryBarView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

final class CategoryBarView: NibView {
    
    /// 카테고리 바에서 사용할 카테고리 종류를 정의한 열거형입니다.
    enum CategoryType {
        case checking   // 입출금 계좌
        case savings    // 저축 계좌
        case crypto     // 가상 자산
    }

    @IBOutlet weak var checkingLabel: UILabel!
    @IBOutlet weak var savingsLabel: UILabel!
    @IBOutlet weak var cryptoLabel: UILabel!
    
    @IBOutlet weak var checkingLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var savingsLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cryptoLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tabHighlighStrip: UIView!
    
    /// 현재 선택된 카테고리 타입입니다. 외부에서는 읽기만 가능합니다.
    private(set) var currentSelectedType: CategoryType = .checking

    /// 카테고리 선택 이벤트를 전달할 델리게이트 객체입니다.
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

    /// 지정한 카테고리를 선택 상태로 전환합니다.
    ///
    /// - Parameters:
    ///   - type: 선택할 카테고리 타입입니다.
    ///   - animated: 애니메이션 적용 여부입니다. 기본값은 `true`입니다.
    ///
    /// 해당 메서드는 선택된 카테고리에 따라 하이라이트 스트립 위치와
    /// 레이블 색상을 변경하며, 델리게이트를 통해 선택 이벤트를 전달합니다.
    func setSelectionCategory(
        _ type: CategoryBarView.CategoryType,
        animated: Bool = true
    ) {
        switch type {
        case .checking:
            setHighlightStripPosition(.defaultHigh, .defaultLow, .defaultLow)
            setButtonLabelTextColor(.label, .secondaryLabel, .secondaryLabel)
        case .savings:
            setHighlightStripPosition(.defaultLow, .defaultHigh, .defaultLow)
            setButtonLabelTextColor(.secondaryLabel, .label, .secondaryLabel)
        case .crypto:
            setHighlightStripPosition(.defaultLow, .defaultLow, .defaultHigh)
            setButtonLabelTextColor(.secondaryLabel, .secondaryLabel, .label)
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
