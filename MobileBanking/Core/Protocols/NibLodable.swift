//
//  NibLodable.swift
//  MobileBanking
//
//  Created by 김건우 on 6/24/25.
//

import UIKit

/// Nib 파일로부터 로드 가능한 UIView 타입이 구현해야 하는 프로토콜입니다.
/// 이 프로토콜은 nib 이름, nib 객체 생성, nib 로딩 메서드를 제공합니다.
@MainActor
protocol NibLodable: AnyObject {

    /// Nib 파일 이름 (보통 클래스 이름과 동일)
    static var nibName: String { get }

    /// UINib 객체 (Nib 파일에서 로드된 인스턴스)
    static var nib: UINib { get }

    /// nib 파일에서 뷰를 로드하고 현재 뷰에 추가합니다.
    /// - Parameter owner: nib 파일의 owner 객체 (보통 self)
    func loadFromNib(owner: AnyObject)
}

extension NibLodable where Self: UIView {

    /// 클래스 이름을 기반으로 nib 파일 이름을 반환합니다.
    static var nibName: String {
        String(describing: Self.self)
    }

    /// 현재 클래스에 해당하는 nib 파일로부터 UINib 객체를 생성합니다.
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: nibName, bundle: bundle)
    }

    /// nib 파일을 인스턴스화하고 현재 뷰에 하위 뷰로 추가합니다.
    /// - Parameter owner: nib 파일 로딩 시 사용할 owner 객체
    func loadFromNib(owner: AnyObject) {
        guard let nibView = Self.nib.instantiate(withOwner: self).first as? UIView else {
            fatalError("Nib 로딩 실패: \(Self.nibName)")
        }

        nibView.frame = self.bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nibView)
    }
}
