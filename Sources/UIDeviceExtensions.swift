//
// UIDevice+Extensions.swift
//
// Copyright (c) 2017 Nicholas Maccharoli
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public extension UIDeviceComplete where Base == UIDevice {

    private var identifier: Identifier? {
        return System.name.flatMap {
            return Identifier(identifier: $0)
        }
    }

    /// Device family i.e iPhone, iPod, iPad
    var family: DeviceFamily {
        return identifier.flatMap { $0.type } ?? .unknown
    }

    /// Specific model i.e iphone7 or iPhone7s
    var model: DeviceModel {
        return identifier.flatMap { DeviceModel(identifier: $0) } ?? .unknown
    }

    /// Common name for device
    var commonName: String {
        return "\(model)"
    }

    var isIphone: Bool {
        return family == .iPhone
    }

    var isIpad: Bool {
        return family == .iPad
    }

    var isIpod: Bool {
        return family == .iPod
    }

    var isSimulator: Bool {
        return family == .simulator
    }
}


// MARK: - Screen Size Detection

public extension UIDeviceComplete where Base == UIDevice {
    var screenSize: Screen {
        let scale: Double = Double(UIScreen.main.scale)
        let width: Double = Double(UIScreen.main.bounds.width)
        let height: Double = Double(UIScreen.main.bounds.height)

        return Screen(width: width, height: height, scale: scale)
    }
}
