//
//  Crypto.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit
import DeveloperToolsSupport

/// 암호화폐(가상자산)의 시세 정보를 나타내는 모델입니다.
/// 로고 이미지, 심볼, 전체 이름, 현재 가격, 가격 변동 정보를 포함합니다.
struct Crypto {
    
    /// 암호화폐의 로고 이미지 리소스입니다.
    let logoResource: ImageResource
    
    /// 리소스를 기반으로 생성된 실제 로고 이미지입니다.
    var logo: UIImage {
        UIImage(resource: logoResource)
    }
    
    /// 암호화폐의 심볼(예: "BTC", "ETH")입니다.
    let ticker: String
    
    /// 암호화폐의 전체 이름(예: "Bitcoin", "Ethereum")입니다.
    let fullName: String
    
    /// 현재 시장 가격입니다. (예: 64789.20)
    let currentPrice: Double
    
    /// 전일 대비 가격 변동 금액입니다. (양수: 상승, 음수: 하락)
    let amountDifference: Double
    
    /// 전일 대비 금액 차이에 대한 변화율입니다. (예: 0.025 → 2.5%)
    let changeRate: Double
    
    /// 지난 24시간 동안 가격 변동 배열입니다.
    //var price24h: [Double]
}

extension Crypto: Hashable {
}

extension Crypto {

    static let mock: [Self] = [
        .init(
            logoResource: .bitcoin,
            ticker: "BTC",
            fullName: "Bitcoin",
            currentPrice: 64789.20,
            amountDifference: 512.45,
            changeRate: 0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "ETH",
            fullName: "Ethereum",
            currentPrice: 3421.87,
            amountDifference: -75.34,
            changeRate: -0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "BNB",
            fullName: "Binance Coin",
            currentPrice: 589.21,
            amountDifference: 12.88,
            changeRate: 0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "SOL",
            fullName: "Solana",
            currentPrice: 142.66,
            amountDifference: -4.22,
            changeRate: -0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "ADA",
            fullName: "Cardano",
            currentPrice: 0.3765,
            amountDifference: 0.012,
            changeRate: 0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "XRP",
            fullName: "Ripple",
            currentPrice: 0.5692,
            amountDifference: -0.018,
            changeRate: -0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "DOGE",
            fullName: "Dogecoin",
            currentPrice: 0.1481,
            amountDifference: 0.0043,
            changeRate: 0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "DOT",
            fullName: "Polkadot",
            currentPrice: 6.24,
            amountDifference: -0.31,
            changeRate: -0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "AVAX",
            fullName: "Avalanche",
            currentPrice: 27.89,
            amountDifference: 0.96,
            changeRate: 0.025
        ),
        .init(
            logoResource: .bitcoin,
            ticker: "LINK",
            fullName: "Chainlink",
            currentPrice: 14.03,
            amountDifference: 0.27,
            changeRate: 0.025
        )
    ]
}
