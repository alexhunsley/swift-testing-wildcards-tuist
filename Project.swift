import ProjectDescription

let project = Project(
    name: "TestingWildcards",
    targets: [
        .target(
            name: "TestingWildcards",
            destinations: .iOS,
            product: .staticLibrary,
            bundleId: "dev.tuist.TestingWildcards",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Package/Sources/**"],
            settings: .settings(base: [
                "SWIFT_VERSION": "6.0",
                "OTHER_SWIFT_FLAGS": [
                    "-enable-actor-data-race-checks",
                    "-strict-concurrency=complete"
                ]
            ])
        ),
        .target(
            name: "TestingWildcardsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TestingWildcardsTests",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .default,
            sources: ["Package/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "TestingWildcards")
            ]
        ),
    ],
    additionalFiles: [
        "Package/README.md",
        "Package/Package.swift" // the SPM file
    ]
)
