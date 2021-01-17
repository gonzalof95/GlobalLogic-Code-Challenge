//
//  MainViewController.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: BaseViewController {
    var presenter: MainPresenter?
    var songsArray: [SongModel] = []
    var mainView: MainView?
    private let disposebag = DisposeBag()
    var lastSearch = ""

    init(with presenter: MainPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain)
        setScreenTitle()
    }

    private func setView() {
        self.mainView = MainView()
        guard let strongCustomView = mainView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self
        view.addSubview(strongCustomView)
        mainView?.autoPinEdgesToSuperviewEdges()

        listenToSearchBar()
    }

    private func listenToSearchBar() {
        mainView?.searchBar.rx.text.orEmpty
            .filter({ text in
                return text.count > 3
            })
            .debounce(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { text in
                self.presenter?.executeGet(search: text)
                self.lastSearch = text
                print(text)
        })
        .disposed(by: disposebag)
    }

    private func setupTable(_ songs: [SongModel]) {
        songsArray = songs
        mainView?.tableView.reloadData()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func setupView(_ songs: [SongModel]) {
        setupTable(songs)
    }

    func reloadTable(_ songs: [SongModel]) {
        songsArray += songs
        presenter?.apiCalled = false
        mainView?.tableView.reloadData()
    }
}
