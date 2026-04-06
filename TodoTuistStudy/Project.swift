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
                "TodoTuistStudy/App/Sources/**/*.swift"
            ],
            resources: [
                "TodoTuistStudy/App/Sources/Resources/**"
            ],
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Data"),
                .target(name: "TodoListFeature"),
                .target(name: "TodoDetailFeature"),
                .target(name: "TodoEditFeature")
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
            name: "TodoListFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.TodoListFeature",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoListFeature/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoListFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TodoListFeatureTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoListFeature/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoListFeature"),
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoDetailFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.TodoDetailFeature",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoDetailFeature/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoDetailFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TodoDetailFeatureTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoDetailFeature/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoDetailFeature"),
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoEditFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.TodoEditFeature",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoEditFeature/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "TodoEditFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TodoEditFeatureTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Features/TodoEditFeature/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoEditFeature"),
                .target(name: "Domain")
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
        ),
        .target(
            name: "Data",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Data",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Data/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "DataTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.DataTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Data/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "Data"),
                .target(name: "Domain")
            ]
        )
    ]
)
