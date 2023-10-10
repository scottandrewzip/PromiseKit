// swift-tools-version: 5.8

import PackageDescription

let pkg = Package(name: "PromiseKit")

pkg.platforms = [
   .macOS(.v10_13), .iOS(.v11), .tvOS(.v11), .watchOS(.v4)
]

pkg.products = [
    .library(name: "PromiseKit", targets: ["PromiseKit"]),
]

let pmk: Target = .target(name: "PromiseKit")
pmk.path = "Sources"
pmk.exclude = [
    "AnyPromise.swift",
    "AnyPromise.m",
    "PMKCallVariadicBlock.m",
    "dispatch_promise.m",
    "join.m",
    "when.m",
    "NSMethodSignatureForBlock.m",
    "after.m",
    "hang.m",
    "race.m",
    "Deprecations.swift"
]

pkg.targets = [
    pmk,
    .testTarget(name: "APlus", dependencies: ["PromiseKit"], path: "Tests/A+"),
    .testTarget(name: "CorePromise", dependencies: ["PromiseKit"], path: "Tests/CorePromise"),
]
