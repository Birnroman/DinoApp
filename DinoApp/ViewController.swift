
import UIKit

class ViewController: UIViewController {
  
  let dinoImageNames: [String] = [
    "dino1",
    "dino2",
    "dino3",
    "dino4",
    "dino5",
    "dino6",
    "dino7",
    "dino8",
    "dino9",
    "dino10",
  ]
  
  lazy var backgoundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "background")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var topImagesStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = -20
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  lazy var buttonsBlockView: UIVisualEffectView = {
    let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialDark))
    view.clipsToBounds = true
    view.layer.cornerRadius = 32
    view.layer.borderWidth = 1
    view.layer.borderColor = CGColor(red: 100, green: 100, blue: 100, alpha: 100)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var whereLabel: UILabel = {
    let label = UILabel()
    label.text = "Куда перейти?"
    label.textColor = .white
    label.font = .systemFont(ofSize: 46, weight: .medium)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var tableButton: UIButton = {
    let button = UIButton()
    button.setTitle("Таблица", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
    button.backgroundColor = UIColor(named: "buttonPrimary")
    button.layer.cornerRadius = 22
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)
    
    return button
  }()
  
  lazy var collectionButton: UIButton = {
    let button = UIButton()
    button.setTitle("Коллекция", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
    button.backgroundColor = UIColor(named: "buttonSecondary")
    button.layer.cornerRadius = 22
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)
    
    return button
  }()
  
  lazy var helpButton: UIButton = {
    let button = UIButton()
    button.setTitle("Ой, сложно. Хелп", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 12
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(backgoundImageView)
    view.addSubview(topImagesStackView)
    view.addSubview(buttonsBlockView)
    
    buttonsBlockView.contentView.addSubview(whereLabel)
    buttonsBlockView.contentView.addSubview(tableButton)
    buttonsBlockView.contentView.addSubview(collectionButton)
    
    view.addSubview(helpButton)
    
    setupLayout()
    
  }
  
  @objc func goToSecond() {
    navigationController?.pushViewController(TableViewController(), animated: true)
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      
      backgoundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgoundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      backgoundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgoundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      topImagesStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      topImagesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      buttonsBlockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
      buttonsBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
      buttonsBlockView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      whereLabel.topAnchor.constraint(equalTo: buttonsBlockView.topAnchor, constant: 30),
      whereLabel.leadingAnchor.constraint(equalTo: buttonsBlockView.leadingAnchor, constant: 30),
      whereLabel.trailingAnchor.constraint(equalTo: buttonsBlockView.trailingAnchor, constant: -30),
      
      tableButton.topAnchor.constraint(equalTo: whereLabel.bottomAnchor, constant: 30),
      tableButton.leadingAnchor.constraint(equalTo: buttonsBlockView.leadingAnchor, constant: 30),
      tableButton.trailingAnchor.constraint(equalTo: buttonsBlockView.trailingAnchor, constant: -30),
      tableButton.heightAnchor.constraint(equalToConstant: 68),
      
      collectionButton.topAnchor.constraint(equalTo: tableButton.bottomAnchor, constant: 12),
      collectionButton.leadingAnchor.constraint(equalTo: buttonsBlockView.leadingAnchor, constant: 30),
      collectionButton.trailingAnchor.constraint(equalTo: buttonsBlockView.trailingAnchor, constant: -30),
      collectionButton.heightAnchor.constraint(equalToConstant: 68),
      collectionButton.bottomAnchor.constraint(equalTo: buttonsBlockView.bottomAnchor, constant: -30),
      
      helpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
      helpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
      helpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
      helpButton.heightAnchor.constraint(equalToConstant: 50),

      
    ])
    
    dinoImageNames.prefix(3).forEach { name in
      let imageView = UIImageView(image: UIImage(named: name))
      imageView.contentMode = .scaleAspectFill
      imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
      imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
      imageView.layer.cornerRadius = 40
      imageView.clipsToBounds = true
      topImagesStackView.addArrangedSubview(imageView)
    }
  }
}
