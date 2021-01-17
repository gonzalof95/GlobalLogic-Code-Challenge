//
//  BaseViewControllerTest.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import XCTest
@testable import GlobalLogic

final class BaseViewControllerTest: XCTestCase {
    var mock: BaseViewControllerMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testShowAnimationInvoked() {
        givenMock()
        whenShowAnimation()
        assertTestShowAnimation()
    }

    func testHideAnimation() {
        givenMock()
        whenHideAnimation()
        assertTestHideAnimation()
    }

    func testPushNextViewController() {
        givenMock()
        let mockViewController = BaseViewController()
        whenNextViewControllerPushed(mockViewController)
        assertTestNextViewControllerPushed(mockViewController)
    }
}

private extension BaseViewControllerTest {
    func givenMock() {
        mock = BaseViewControllerMock()
    }

    func whenShowAnimation() {
        mock.showAnimation()
    }

    func whenHideAnimation() {
        mock.hideAnimation()
    }

    func whenNextViewControllerPushed(_ mockViewController: BaseViewController) {
        mock.pushNextViewController(mockViewController)
    }

    func assertTestShowAnimation() {
        XCTAssertTrue(mock.invokedShowAnimation)
        XCTAssertEqual(mock.invokedShowAnimationCount, 1)
    }

    func assertTestHideAnimation() {
        XCTAssertTrue(mock.invokedHideAnimation)
        XCTAssertEqual(mock.invokedHideAnimationCount, 1)
    }

    func assertTestNextViewControllerPushed(_ mockViewController: BaseViewController) {
        XCTAssertTrue(mock.invokedPushNextViewController)
        XCTAssertEqual(mock.invokedPushNextViewControllerCount, 1)
        XCTAssertEqual(mock.invokedPushNextViewControllerParameters, mockViewController)
    }
}
