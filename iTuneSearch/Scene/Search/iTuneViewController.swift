//
//  iTuneViewController.swift
//  iTuneSearch
//
//  Created by 선상혁 on 2023/11/09.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources
import Kingfisher

final class iTuneViewController: UIViewController {
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        return view
    }()
    
    let disposeBag = DisposeBag()
    let data: [AppData] = []
    lazy var items = BehaviorSubject(value: data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "앱"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        bind()
        configure()
    }
    
    private func bind() {
        
        items
            .bind(to: collectionView.rx.items(cellIdentifier: iTuneCollectionViewCell.identifier, cellType: iTuneCollectionViewCell.self)) { (row, element, cell) in
                cell.titleLabel.text = element.trackName
                cell.descriptionLabel.text = element.description
                cell.appImageView.kf.setImage(with: URL(string: element.artworkUrl512))
            }
            .disposed(by: disposeBag)
        
        let request = iTuneAPIManager.shared.fetchData()
            .asDriver(onErrorJustReturn: iTuneData(resultCount: 0, results: []))
        
        request
            .drive(with: self) { owner, value in
                owner.items.onNext(value.results)
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .subscribe(with: self) { owner, indexPath in
                let vc = AppDetailViewController()
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func configure() {
        view.addSubview(collectionView)
        
        collectionView.register(iTuneCollectionViewCell.self, forCellWithReuseIdentifier: iTuneCollectionViewCell.identifier)
        collectionView.backgroundColor = .yellow
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing = CGFloat(10)
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        
        return layout
    }
}
