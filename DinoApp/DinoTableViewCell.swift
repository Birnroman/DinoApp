

import UIKit

class DinoTableViewCell: UITableViewCell {

    lazy var dinoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dino_icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var dinoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dinoTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightArrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with dino: Dino) {
        dinoNameLabel.text = dino.name
        dinoTypeLabel.text = dino.type.rawValue
    }
    
    func setupLayout() {
        let mainStackView = UIStackView(arrangedSubviews: [dinoImage, dinoNameLabel, dinoTypeLabel])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalCentering
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(mainStackView)
        contentView.addSubview(rightArrowImage)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            rightArrowImage.heightAnchor.constraint(equalToConstant: 30),
            rightArrowImage.widthAnchor.constraint(equalToConstant: 30),
            rightArrowImage.topAnchor.constraint(equalTo: contentView.topAnchor),

            rightArrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

extension DinoTableViewCell {
    static var reuseIdenifier: String {
        return String(describing: self)
    }
}
