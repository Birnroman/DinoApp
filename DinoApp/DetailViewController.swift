

import UIKit

class DetailViewController: UIViewController {
    
    var dino: Dino?
    
    lazy var dinoLargeImage: UIImageView = {
        let image = UIImageView()

        image.layer.shadowRadius = 80
        image.layer.shadowOpacity = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var dinoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Огромные челюсти, крошечные лапки, статус «короля»."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(dinoLargeImage)
        view.addSubview(dinoDescriptionLabel)

        setupLayout()
        setupHeaderStyle()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            dinoLargeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dinoLargeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dinoLargeImage.heightAnchor.constraint(equalToConstant: 260),
            dinoLargeImage.widthAnchor.constraint(equalToConstant: 260),

            dinoDescriptionLabel.topAnchor.constraint(equalTo: dinoLargeImage.bottomAnchor, constant: 24),
            dinoDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            dinoDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
    }
    func setupHeaderStyle() {
        if let currentDino = dino {
            dinoLargeImage.image = UIImage(named: currentDino.image)
            dinoLargeImage.layer.shadowColor = UIColor(named: currentDino.color)?.cgColor
            navigationItem.title = dino?.name
            dinoDescriptionLabel.text = dino?.description
        }
        
        view.backgroundColor = .black
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
    
}
