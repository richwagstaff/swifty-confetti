# SwiftyConfetti

Important: This package requires UIKit.

It uses CAEmitterLayer to emit confetti from the top of the view.

# Usage

## SwiftUI
```
@State private var confettiCount = 0

var body: some View {
    ZStack {
        Confetti(
            count: confettiCount,
            rate: 0.3,
            delay: 0,
            duration: 5
        )
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Button") {
                // Re-triggers the confetti
                confettiCount += 1
            }
        }
        .padding()
    }
}
```


## UIKit
```
let confetti = ConfettiView(frame: view.bounds)
confetti.startConfetti()
```

# Configuration
You can configure the confetti with a `ConfettiConfig` object.

```
let configuration = ConfettiConfig(
    colors: [.red, .green, .blue],
    images: [UIImage(named: "MyImage"],
    shapes: [.circle, .triangle, .square, .arc, .square]
)
```

### Configuration Parameters

`colors` - The colors of the confetti.

`images` - The images of the confetti. Note: The image will be shown as-is, without any color modification.

`shapes` - The default confetti shapes.
