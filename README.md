# DiffusionKit

DiffusionKit 是一个高性能渐变渲染库，用于创建鲜活、可动画的类 Mesh Gradient 视图。它提供了可直接使用的预设和更灵活的参数控制，可作为 SwiftUI MeshGradientView 的增强替代方案。

<p align="center">
  <img src="./Example/Screenshot_iOS.png" alt="iOS" width="240"/>
  <img src="./Example/Screenshot_macOS.png" alt="macOS" width="800"/>
</p>

## 平台支持

支持 UIKit 和 AppKit 平台。

```
platforms: [
    .iOS(.v14),
    .macOS(.v11),
    .tvOS(.v14),
    .visionOS(.v1),
],
```

## 使用方式

先在项目中添加该依赖：

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/DiffusionKit.git", from: "1.1.0"),
]
```

然后把 `DiffusionKit` 加到 target 依赖中：

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "DiffusionKit", package: "DiffusionKit"),
    ]
)
```

从 DiffusionKit 1.1.0 开始，`ColorVector`、`MSDisplayLink`、`SpringInterpolation`
不再以内置源码 target 的形式随包分发，而是改为直接依赖 `https://github.com/HapticTide/`
下的上游 package。当前 `DiffusionKit` 只导出 `DiffusionKit` 这一个 product。
如果你的业务代码会直接 `import` 这三个模块，请在自己的 `Package.swift` 里显式添加对应上游依赖。

更完整的用法可以直接看示例工程。示例 App 内置了多组渐变预设，预设名称可以在 `DiffusionPreset`
里找到，然后把对应颜色传给 `DiffusionView` 即可。

### SwiftUI

使用默认动画渲染动态渐变：

```swift
import SwiftUI
import DiffusionKit

struct ContentView: View {
    // 直接使用 [SwiftUI.Color] 即可，最多支持 8 个颜色槽位。
    @State var colors: [Color] = DiffusionPreset.aurora.colors

    var body: some View {
        DiffusionView(color: $colors)
            .ignoresSafeArea()
    }
}
```

可用于控制动画和渲染效果的参数如下：

```swift
@Binding var color: [Color]
@Binding var speed: Double
@Binding var bias: Double
@Binding var noise: Double
@Binding var transitionSpeed: Double
@Binding var frameLimit: Int
@Binding var renderScale: Double

DiffusionView(
    color: $colors,
    speed: $speed,
    bias: $bias,
    noise: $noise,
    transitionSpeed: $transitionSpeed,
    frameLimit: $frameLimit,
    renderScale: $renderScale,
    repeats: true
)
```

如果要创建静态渐变，可以给 `DiffusionView` 传 `speed: .constant(0)`，也可以直接使用 `MulticolorGradient`：

```swift
import SwiftUI
import DiffusionKit

struct StaticView: View {
    var body: some View {
        MulticolorGradient(parameters: .init(
            points: [
                .init(color: .init(.init(Color.red)), position: .init(x: 0, y: 0)),
                .init(color: .init(.init(Color.blue)), position: .init(x: 1, y: 0)),
                .init(color: .init(.init(Color.green)), position: .init(x: 0, y: 1)),
                .init(color: .init(.init(Color.yellow)), position: .init(x: 1, y: 1)),
            ],
            bias: 0.01,
            power: 4,
            noise: 32
        ))
    }
}
```

### UIKit/AppKit

使用默认动画渲染动态渐变：

```swift
import ColorVector
import DiffusionKit

let view = AnimatedMulticolorGradientView()
view.setColors(
    DiffusionPreset.aurora.colors.map { ColorVector($0) },
    animated: false
)
view.speed = speed
view.bias = bias
view.noise = noise
view.transitionSpeed = transitionSpeed
view.frameLimit = frameLimit
view.renderScale = renderScale
```

渲染静态渐变：

```swift
import ColorVector
import DiffusionKit

let view = MulticolorGradientView()
view.parameters = .init(points: [
    .init(color: .init(v: .init(255, 0, 0, 1), space: .rgb), position: .init(x: 1, y: 0)),
    .init(color: .init(v: .init(0, 255, 0, 1), space: .rgb), position: .init(x: 0, y: 0)),
    .init(color: .init(v: .init(0, 0, 255, 1), space: .rgb), position: .init(x: 0, y: 1)),
    .init(color: .init(v: .init(255, 255, 255, 1), space: .rgb), position: .init(x: 1, y: 1)),
], bias: 0.01, power: 2, noise: 32)
view.renderScale = 1
```

### 自定义预设

从 DiffusionKit 1.0.0 开始，可以通过实现 `DiffusionColors` 协议来自定义预设，例如：

```swift
enum MyPresets: DiffusionColors {
    case white

    var colors: [ColorElement] {
        [
            make(255, 255, 255),
            make(244, 244, 244),
            make(233, 233, 233),
            make(222, 222, 222),
        ]
    }
}

// SwiftUI 用法
DiffusionView(color: MyPresets.white)

// UIKit/AppKit 用法
let view = AnimatedMulticolorGradientView()
view.setColors(MyPresets.white.colors.map { ColorVector($0) })
```



## 许可证

本项目使用 MIT 协议，详见 [LICENSE](LICENSE)。

Shader 代码源自 [SwiftUI-MulticolorGradient](https://github.com/ArthurGuibert/SwiftUI-MulticolorGradient)，
原作者署名已在 License 文件中保留。
