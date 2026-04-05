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
            buildableFolders: [
                "TodoTuistStudy/Sources",
                "TodoTuistStudy/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "TodoTuistStudyTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TodoTuistStudyTests",
            infoPlist: .default,
            buildableFolders: [
                "TodoTuistStudy/Tests"
            ],
            dependencies: [.target(name: "TodoTuistStudy")]
        ),
    ]
)
