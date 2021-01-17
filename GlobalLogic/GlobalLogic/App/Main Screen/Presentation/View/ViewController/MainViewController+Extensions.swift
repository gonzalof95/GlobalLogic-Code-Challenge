//
//  MainViewController+Extensions.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongsTableViewCell.identifier) as! SongsTableViewCell
        cell.configure(with: songsArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.rowTapped(song: songsArray[indexPath.row])
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height {
            presenter?.requestMoreData(presenter?.apiCalled ?? false,
                                       presenter?.timesRecalled ?? 0,
                                       true,
                                       lastSearch)
        }
    }
}
