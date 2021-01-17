//
//  MainView.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit
import PureLayout

class MainView: UIView {
    var tableView = UITableView(forAutoLayout: ())
    var searchBar = UISearchBar(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        setView()
        registerTableViewCells()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(searchBar)
        addSubview(tableView)

        backgroundColor = .black

        searchBar.placeholder = "Search"
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .customColorMain
        searchBar.showsSearchResultsButton = true

        tableView.backgroundColor = .black
        tableView.separatorStyle = .none

        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.autoPinEdges(toSuperviewMarginsExcludingEdge: .bottom)

        tableView.autoPinEdges(toSuperviewMarginsExcludingEdge: .top)
        tableView.autoPinEdge(.top, to: .bottom, of: searchBar)
    }

    private func registerTableViewCells() {
        tableView.register(SongsTableViewCell.nib(), forCellReuseIdentifier: "SongsTableViewCell")
    }
}
