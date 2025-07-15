//
//  APIKeyManager.swift
//  PeakTime
//
//

import Foundation

struct APIKeyManager {
    private static let bundle = Bundle.main
    
    static var kakaopayAPIKey: String {
        guard let key = bundle.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as? String else {
            fatalError("Kakao App Key not found in Info.plist")
        }
        return key
    }
    
    static var weatherAPIKey: String{
        guard let key = bundle.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String else {
            fatalError("Weather API Key not found in Info.plist")
        }
        return key
    }
    
    static var tourAPIKey: String{
        guard let key = bundle.object(forInfoDictionaryKey: "TOUR_API_KEY") as? String else {
            fatalError("Tour API Key not found in Info.plist")
        }
        return key
    }
}

