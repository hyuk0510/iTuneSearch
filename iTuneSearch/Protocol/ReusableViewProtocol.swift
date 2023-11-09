//
//  ReusableViewProtocol.swift
//  iTuneSearch
//
//  Created by 선상혁 on 2023/11/09.
//

import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    static var identifier: String {
        return description()
    }
}

extension UICollectionViewCell: ReusableViewProtocol {
    static var identifier: String {
        return description()
    }
}
