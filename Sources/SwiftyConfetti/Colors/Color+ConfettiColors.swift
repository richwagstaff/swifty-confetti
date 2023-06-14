#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, *)
public extension Color {
    static var confettiYellow: Color {
        ConfettiColor.yellow.color
    }

    static var confettiGreen: Color {
        ConfettiColor.green.color
    }

    static var confettiTeal: Color {
        ConfettiColor.teal.color
    }

    static var confettiBlue: Color {
        ConfettiColor.blue.color
    }

    static var confettiPink: Color {
        ConfettiColor.pink.color
    }
}
#endif
