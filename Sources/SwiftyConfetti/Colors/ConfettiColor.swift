import Foundation

public enum ConfettiColor: String, CaseIterable {
    case teal, pink, green, blue, yellow
}

#if canImport(SwiftUI)
import SwiftUI
extension ConfettiColor {
    @available(macOS 10.15, *)
    var color: Color {
        switch self {
        case .teal:
            return Color(red: 0/255, green: 176/255, blue: 161/255)
        case .pink:
            return Color(red: 253/255, green: 24/255, blue: 141/255)
        case .green:
            return Color(red: 152/255, green: 212/255, blue: 2/255)
        case .blue:
            return Color(red: 70/255, green: 186/255, blue: 237/255)
        case .yellow:
            return Color(red: 255/255, green: 214/255, blue: 0/255)
        }
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension ConfettiColor {
    var uiColor: UIColor {
        switch self {
        case .teal:
            return UIColor(red: 0/255, green: 176/255, blue: 161/255, alpha: 1)
        case .pink:
            return UIColor(red: 253/255, green: 24/255, blue: 141/255, alpha: 1)
        case .green:
            return UIColor(red: 152/255, green: 212/255, blue: 2/255, alpha: 1)
        case .blue:
            return UIColor(red: 70/255, green: 186/255, blue: 237/255, alpha: 1)
        case .yellow:
            return UIColor(red: 255/255, green: 214/255, blue: 0/255, alpha: 1)
        }
    }
}

#endif
