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
                .target(name: "Repository"),
                .target(name: "CacheData"),
                .target(name: "NetworkData"),
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
                .target(name: "TodoListFeature")
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
                .target(name: "TodoDetailFeature")
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
                .target(name: "TodoEditFeature")
            ]
        ),
        .target(
            name: "Repository",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Repository",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Repository/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Domain")
            ]
        ),
        .target(
            name: "RepositoryTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.RepositoryTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/Repository/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "Repository")
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
            name: "CacheData",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.CacheData",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/CacheData/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "CacheDataTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.CacheDataTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/CacheData/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "CacheData"),
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "NetworkData",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.NetworkData",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/NetworkData/Sources/**/*.swift"
            ],
            dependencies: [
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "NetworkDataTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.NetworkDataTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/NetworkData/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "NetworkData"),
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "TodoListFeatureDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TodoListFeatureDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "TodoTuistStudy/Features/TodoListFeature/DemoApp/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoListFeature"),
                .target(name: "Repository"),
                .target(name: "CacheData"),
                .target(name: "NetworkData")
            ]
        ),
        .target(
            name: "TodoDetailFeatureDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TodoDetailFeatureDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "TodoTuistStudy/Features/TodoDetailFeature/DemoApp/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoDetailFeature"),
                .target(name: "Repository"),
                .target(name: "CacheData"),
                .target(name: "NetworkData")
            ]
        ),
        .target(
            name: "TodoEditFeatureDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TodoEditFeatureDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "TodoTuistStudy/Features/TodoEditFeature/DemoApp/**/*.swift"
            ],
            dependencies: [
                .target(name: "TodoEditFeature"),
                .target(name: "Repository"),
                .target(name: "CacheData"),
                .target(name: "NetworkData")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "TodoListFeatureDemo",
            buildAction: .buildAction(targets: ["TodoListFeatureDemo"])
        ),
        .scheme(
            name: "TodoDetailFeatureDemo",
            buildAction: .buildAction(targets: ["TodoDetailFeatureDemo"])
        ),
        .scheme(
            name: "TodoEditFeatureDemo",
            buildAction: .buildAction(targets: ["TodoEditFeatureDemo"])
        ),
    ]
)
