//
//  iTuneCollectionViewCell.swift
//  iTuneSearch
//
//  Created by 선상혁 on 2023/11/09.
//

import UIKit
import RxSwift

final class iTuneCollectionViewCell: UICollectionViewCell {
    
    let appImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        return view
    }()
    
    let downloadButton = {
        let view = UIButton()
        view.setTitle("받기", for: .normal)
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    private func configure() {
        [appImageView, titleLabel, downloadButton].forEach { subview in
            contentView.addSubview(subview)
        }
        
        contentView.backgroundColor = .white
        
        appImageView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.width.equalTo(appImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.top)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
