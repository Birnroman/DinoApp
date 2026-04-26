import UIKit

class DinoCollectionViewCell: UICollectionViewCell {
    
    lazy var dinoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var dinoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dinoTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with dino: Dino) {
        dinoNameLabel.text = dino.name
        dinoTypeLabel.text = dino.type.rawValue
        dinoImage.image = UIImage(named: dino.image)
    }
    
    func setupLayout() {
        
        contentView.addSubview(dinoImage)
        contentView.addSubview(dinoNameLabel)
        contentView.addSubview(dinoTypeLabel)
        
        
        NSLayoutConstraint.activate([
            dinoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dinoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dinoImage.widthAnchor.constraint(equalToConstant: 130),
            dinoImage.heightAnchor.constraint(equalToConstant: 130),
            
            dinoNameLabel.topAnchor.constraint(equalTo: dinoImage.bottomAnchor, constant: 12),
            dinoNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dinoNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            dinoTypeLabel.topAnchor.constraint(equalTo: dinoNameLabel.bottomAnchor, constant: 4),
            dinoTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dinoTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
    
    func setupStyle() {
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
    }
}

extension DinoCollectionViewCell {
    static var reuseIdenifier: String {
        return String(describing: self)
    }
}
