import ProjectDescription

let project = Project(
    name: "TodoTuistStudy",
    targets: [
        .target(
            name: "TodoTuistStudy",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TodoTuistStudy",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "TodoTuistStudy/App/**/*.swift"
            ],
            resources: [
                "TodoTuistStudy/App/Resources/**"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoTuistStudyTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TodoTuistStudyTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/App/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoTuistStudy")
            ]
        ),
        .target(
            name: "Domain",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Domain",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Domain/Sources/**/*.swift"
            ],
            dependencies: []
        ),
        .target(
            name: "DomainTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.DomainTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Domain/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        )
    ]
)
