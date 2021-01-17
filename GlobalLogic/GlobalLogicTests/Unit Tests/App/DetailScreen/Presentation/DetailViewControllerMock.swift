//
//  DetailViewControllerMock.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

@testable import GlobalLogic

class DetailViewControllerMock: DetailViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0
    var invokedSetupViewParameters: (song: SongModel, Void)?
    var invokedSetupViewParametersList = [(song: SongModel, Void)]()

    func setupView(_ song: SongModel) {
        invokedSetupView = true
        invokedSetupViewCount += 1
        invokedSetupViewParameters = (song, ())
        invokedSetupViewParametersList.append((song, ()))
    }
}
