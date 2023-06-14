import SwiftUI
#if canImport(UIKit)

public struct Confetti: UIViewRepresentable {
    var count: Int
    var config = ConfettiConfig()
    var rate: Float = 1
    var delay: TimeInterval
    var duration: TimeInterval

    public init(
        count: Int,
        config: ConfettiConfig = ConfettiConfig(),
        rate: Float = 1,
        delay: TimeInterval,
        duration: TimeInterval
    ) {
        self.count = count
        self.delay = delay
        self.duration = duration
        self.config = config
        self.rate = rate
    }

    public func makeUIView(context: Context) -> ConfettiView {
        ConfettiView()
    }

    public func updateUIView(_ uiView: ConfettiView, context: Context) {
        uiView.config = config

        uiView.startConfetti(
            rate: rate,
            delay: delay,
            stopAfter: duration
        )
    }
}

#endif
