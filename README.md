# Lotus
[![Build Status](https://travis-ci.org/vkondrashkov/lotus.svg?branch=develop)](https://travis-ci.org/vkondrashkov/lotus)
[![codecov](https://codecov.io/gh/vkondrashkov/lotus/branch/develop/graph/badge.svg)](https://codecov.io/gh/vkondrashkov/lotus)
![Language](https://img.shields.io/badge/swift-5-orange.svg)
[![License](https://img.shields.io/github/license/vkondrashkov/lotus.svg)](https://github.com/vkondrashkov/lotus/blob/develop/LICENSE)

__Lotus__ – powerful nano framework that helps implement layer animation with easy syntax. This DSL relieves you from routine code of making animations via CoreAnimation.

## Contents
- [Getting started](#getting_started)
    - [Requirements](#requirements)
    - [Installing](#installing)
    - [Usage](#usage)
- [Documentation](#documentation)

## Getting started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Requirements 
- Xcode 10.2+
- Cocoapods 1.7.0+
- Git client

### Installing
#### CocoaPods
1. In terminal switch to your repository with project
2. Specify Lotus in your `Podfile`:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Lotus'
end
```
3. Run `pod install` command

### Usage
1. Import Lotus into your project
```Swift
import Lotus
```
2. Create any layer and add to `view`'s hierarchy 
```Swift
let redSquareLayer = CALayer()
redSquareLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
view.layer.addSublayer(redSquareLayer)
```
3. Then run any needed animation whenever you need
```Swift
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
- __Vladislav Kondrashkov__ - _Initial work_ - [vkondrashkov](https://github.com/vkondrashkov "Vladislav Kondrashkov")

See also the list of [contributors](https://github.com/vkondrashkov/lotus/graphs/contributors "Contributors") who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/vkondrashkov/ListenTo-iOS/blob/develop/LICENSE "MIT License") file for details
