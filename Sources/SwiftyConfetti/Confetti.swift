
import SwiftUI
#if canImport(UIKit)

public struct Confetti: UIViewRepresentable {
    var count: Int
    var rate: Float = 1
    var delay: TimeInterval
    var duration: TimeInterval
    var intensity: Float = 1

    public init(count: Int, rate: Float = 1, delay: TimeInterval, duration: TimeInterval, intensity: Float = 1) {
        self.count = count
        self.delay = delay
        self.duration = duration
        self.intensity = intensity
        self.rate = rate
    }

    public func makeUIView(context: Context) -> ConfettiView {
        ConfettiView()
    }

    public func updateUIView(_ uiView: ConfettiView, context: Context) {
        // uiView.intensity = intensity
        // uiView.shapes = ConfettiShape.allCases
        // uiView.images = []
        // uiView.colors = [.red, .green, .blue]
        uiView.startConfetti(
            rate: rate,
            delay: delay,
            stopAfter: duration
        )
        /*
         if drop {
             if !uiView.isEmitting {
                 uiView.start(rate: rate, delay: delay, stopAfter: duration)
             }
         }
         else {
             uiView.stop()
         }*/
    }
}

#endif
