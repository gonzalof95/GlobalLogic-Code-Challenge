//
//  MainViewControllerMock.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

@testable import GlobalLogic

class MainViewControllerMock: MainViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0
    var invokedSetupViewParameters: (songs: [SongModel], Void)?
    var invokedSetupViewParametersList = [(songs: [SongModel], Void)]()

    func setupView(_ songs: [SongModel]) {
        invokedSetupView = true
        invokedSetupViewCount += 1
        invokedSetupViewParameters = (songs, ())
        invokedSetupViewParametersList.append((songs, ()))
    }

    var invokedReloadTable = false
    var invokedReloadTableCount = 0
    var invokedReloadTableParameters: (songs: [SongModel], Void)?
    var invokedReloadTableParametersList = [(songs: [SongModel], Void)]()

    func reloadTable(_ songs: [SongModel]) {
        invokedReloadTable = true
        invokedReloadTableCount += 1
        invokedReloadTableParameters = (songs, ())
        invokedReloadTableParametersList.append((songs, ()))
    }

    var invokedPushNextViewController = false
    var invokedPushNextViewControllerCount = 0
    var invokedPushNextViewControllerParameters: (viewController: BaseViewController, Void)?
    var invokedPushNextViewControllerParametersList = [(viewController: BaseViewController, Void)]()

    func pushNextViewController(_ viewController: BaseViewController) {
        invokedPushNextViewController = true
        invokedPushNextViewControllerCount += 1
        invokedPushNextViewControllerParameters = (viewController, ())
        invokedPushNextViewControllerParametersList.append((viewController, ()))
    }

    var invokedShowAnimation = false
    var invokedShowAnimationCount = 0

    func showAnimation() {
        invokedShowAnimation = true
        invokedShowAnimationCount += 1
    }

    var invokedHideAnimation = false
    var invokedHideAnimationCount = 0

    func hideAnimation() {
        invokedHideAnimation = true
        invokedHideAnimationCount += 1
    }
}
