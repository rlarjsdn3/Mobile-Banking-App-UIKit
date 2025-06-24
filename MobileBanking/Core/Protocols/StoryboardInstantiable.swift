//
//  StoryboardInstantiable.swift
//  MobileBanking
//
//  Created by 김건우 on 6/24/25.
//

import UIKit


/// 스토리보드에서 UIViewController 인스턴스를 생성할 수 있도록 하는 프로토콜입니다.
/// 기본 스토리보드 이름 및 식별자(identifier)를 기반으로 뷰 컨트롤러를 로드합니다.
@MainActor
protocol StoryboardInstantiable: AnyObject {

    /// 스토리보드 파일 이름 (기본값: 클래스 이름)
    static var storyboardName: String { get }

    /// 스토리보드에서 ViewController를 생성합니다.
    /// - Parameters:
    ///   - storyboardName: 스토리보드 이름 (기본값: 클래스 이름)
    ///   - identifier: ViewController의 Storyboard ID (nil이면 initialViewController로 로드)
    /// - Returns: UIViewController 인스턴스
    static func instantiateViewController(
        from storyboardName: String,
        identifier: String?
    ) -> UIViewController
}


extension StoryboardInstantiable where Self: UIViewController {

    /// 클래스 이름을 스토리보드 이름으로 반환합니다.
    static var storyboardName: String {
        String(describing: Self.self)
    }

    /// 주어진 이름의 스토리보드를 현재 클래스 번들에서 로드합니다.
    /// - Parameter name: 스토리보드 이름 (기본값: 클래스 이름)
    static func storyboard(from name: String = Self.storyboardName) -> UIStoryboard {
        let bundle = Bundle(for: Self.self)
        return UIStoryboard(name: name, bundle: bundle)
    }

    /// 스토리보드에서 뷰 컨트롤러를 생성합니다.
    /// - Parameters:
    ///   - storyboardName: 스토리보드 이름 (기본값: 클래스 이름)
    ///   - identifier: Storyboard ID (지정하지 않으면 initialViewController로 시도)
    /// - Returns: UIViewController 인스턴스
    static func instantiateViewController(
        from storyboardName: String = Self.storyboardName,
        identifier: String? = nil
    ) -> UIViewController {
        let storyboard = Self.storyboard(from: storyboardName)

        if let identifier = identifier {
            return storyboard.instantiateViewController(withIdentifier: identifier)
        }

        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Storyboard '\(storyboardName)'에서 \(Self.self)를 초기 뷰 컨트롤러로 로드할 수 없습니다.")
        }
        return vc
    }
}
