

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let dinos = DinoService.sharedDinos
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let spacing: CGFloat = 12
        let side = (UIScreen.main.bounds.width - (24 * 2) - spacing) / 2
        layout.itemSize = CGSize(width: side, height: side * 1.2) // Чуть вытянутые
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(DinoCollectionViewCell.self, forCellWithReuseIdentifier: DinoCollectionViewCell.reuseIdenifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setupLayout()
        
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
        ])
    }
    
    
}

extension CollectionViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DinoService.sharedDinos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DinoCollectionViewCell.reuseIdenifier, for: indexPath) as? DinoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let dino = dinos[indexPath.item]
        cell.configureCell(with: dino)
        return cell
    }
}
