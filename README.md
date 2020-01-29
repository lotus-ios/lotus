# Lotus

![Language](https://img.shields.io/badge/swift-5-orange.svg)
[![Build Status](https://travis-ci.org/vkondrashkov/lotus.svg?branch=develop)](https://travis-ci.org/vkondrashkov/lotus)
[![codecov](https://codecov.io/gh/vkondrashkov/lotus/branch/develop/graph/badge.svg)](https://codecov.io/gh/vkondrashkov/lotus)
[![Version](https://img.shields.io/cocoapods/v/Lotus.svg?style=flat)](http://cocoapods.org/pods/Lotus)
[![License](https://img.shields.io/cocoapods/l/Lotus.svg?style=flat)](https://github.com/vkondrashkov/lotus/blob/develop/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Lotus.svg?style=flat)](http://cocoapods.org/pods/Lotus)

**Lotus** – powerful nano framework that helps implement layer animation with easy syntax. This DSL relieves you from routine code of making animations via CoreAnimation.

<img src="Example/Assets/lotus.gif" alt="Lotus" width="200"/>

```swift
for i in 0..<10 {
    let petalLayer = PetalLayer()
    petalLayer.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 + 60)

    let direction: CGFloat = i % 2 == 0 ? -1.0 : 1.0
    let initialRotationDegree = 3.0 * CGFloat(i / 2) * .pi / 180.0
    let rotateTransform = CGAffineTransform.identity.rotated(by: direction * initialRotationDegree)
    petalLayer.setAffineTransform(rotateTransform)
    view.layer.addSublayer(petalLayer)

    let rotationDegree = 12.0 * CGFloat(i / 2) * .pi / 180.0
    petalLayer.lotus.runAnimation { make in
        make.opacity.to(0.7).during(0.7).delay(1.0)
    }.then { make in
        make.rotation.to(direction * rotationDegree).during(0.6)
    }.then { make in
        make.scaling.to(1.2).delay(0.3).during(1.5).ease(.outElastic)
    }
}
```

## Contents

- [Getting started](#getting_started)
  - [Requirements](#requirements)
  - [Installing](#installing)
  - [Usage](#usage)
- [Documentation](#documentation)
- [Tests](#tests)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

## Getting started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Requirements

- Xcode 10.2+
- Cocoapods 1.7.0+
- Git client

### Installing

#### CocoaPods

1\. In terminal switch to your repository with project  
2\. Specify Lotus in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Lotus'
end
```

3\. Run `pod install` command

### Usage

1\. Import Lotus into your project

```swift
import Lotus
```

2\. Create any layer and add to `view`'s hierarchy

```swift
let redSquareLayer = CALayer()
redSquareLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
view.layer.addSublayer(redSquareLayer)
```

3\. Then run any needed animation whenever you need

```swift
redSquareLayer.lotus.runAnimation { make in
    make.rotation.to(360.0 * .pi / 180.0).during(2.0)
}.then { make in
    make.scaling.to(2.2)
}.then { make in
    make.scaling.to(1.8)
}
```

## Documentation

Find out all accessible facilities in [Documentation](https://github.com/vkondrashkov/lotus/wiki/Documentation)

## Tests

Oops, they have gone somewhere, let's wait for them!

## Contributing

Coming soon!

## Authors

- **Vladislav Kondrashkov** - _Initial work_ - [vkondrashkov](https://github.com/vkondrashkov "Vladislav Kondrashkov")
- **Pavel Kondrashkov** - _Mentor, idea contributor_ - [pkondrashkov](https://github.com/pkondrashkov "Pavel Kondrashkov")

See also the list of [contributors](https://github.com/vkondrashkov/lotus/graphs/contributors "Contributors") who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/vkondrashkov/ListenTo-iOS/blob/develop/LICENSE "MIT License") file for details
