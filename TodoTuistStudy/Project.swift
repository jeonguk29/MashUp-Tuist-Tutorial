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
                .target(name: "CacheData"),
                .target(name: "NetworkData"),
                .target(name: "DataInterface"),
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
            ]
        ),
        .target(
            name: "DataInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.DataInterface",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/DataInterface/Sources/**/*.swift"
            ],
            dependencies: []
        ),
        .target(
            name: "DataInterfaceTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.DataInterfaceTests",
            infoPlist: .default,
            sources: [
                "TodoTuistStudy/DataInterface/Tests/**/*.swift"
            ],
            dependencies: [
                .target(name: "DataInterface")
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
            dependencies: [
                .target(name: "DataInterface")
            ]
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
                .target(name: "Domain"),
                .target(name: "DataInterface")
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
                .target(name: "DataInterface")
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
                .target(name: "Domain")
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
                .target(name: "DataInterface")
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
                .target(name: "Domain")
            ]
        )
    ]
)
