//
//  Extensions.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 28/9/2022.
//

import Foundation
import UIKit


// MARK: - UITableView
extension UITableView {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Dynamic<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
}

// MARK: - UIButton
extension UIButton {
    
    /// Bind a UIButton in order to enable/disable it automatically
    ///
    /// Example:
    /// ```
    /// btnSearch.bindTo(viewModel.isButtonEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Dynamic<Bool>) {
        bindable.bind { [weak self] isEnabled in
            self?.isEnabled = true
        }
    }
}

// MARK: - UIActivityIndicatorView
extension UIActivityIndicatorView {
    /// Bind a UIActivityIndicatorView in order to enable/disable  and animate it automatically
    ///
    /// Example:
    /// ```
    /// activityIndicator.bindTo(viewModel.isLoadingEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Dynamic<Bool>) {
        bindable.bind { [weak self] isEnabled in
            if isEnabled {
                self?.isHidden = false
                self?.startAnimating()
            } else {
                self?.isHidden = true
                self?.stopAnimating()
            }
        }
    }
}
