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
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.numberOfLines = 2
        return view
    }()
    
    let descriptionLabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.font = .systemFont(ofSize: 13)
        view.textColor = .lightGray
        return view
    }()
    
    let downloadButton = {
        let view = UIButton()
        var configure = UIButton.Configuration.gray()
        var title = AttributedString.init("받기")
        title.font = .systemFont(ofSize: 17, weight: .bold)
        configure.attributedTitle = title
//        view.setTitle("받기", for: .normal)
//        view.backgroundColor = .lightGray
//        configure.baseBackgroundColor = .lightGray
//        configure.baseForegroundColor = .systemBlue
        configure.cornerStyle = .capsule
        view.configuration = configure
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
        [appImageView, titleLabel, descriptionLabel, downloadButton].forEach { subview in
            contentView.addSubview(subview)
        }
        
        contentView.backgroundColor = .white
        
        appImageView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.width.equalTo(appImageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.top)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(titleLabel.snp.horizontalEdges)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
    }
}
