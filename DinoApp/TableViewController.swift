import UIKit

struct Dino {
  let name: String
  let type: DinoType
  let image: String
}

enum DinoType: String {
  case predator = "Хищник"
  case herbivore = "Травоядный"
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


  let dinos: [Dino] = [
    Dino(name: "Тираннозавр", type: .predator, image: ""),
    Dino(name: "Трицератопс", type: .herbivore, image: ""),
    Dino(name: "Стегозавр", type: .herbivore, image: ""),
    Dino(name: "Брахиозавр", type: .herbivore, image: ""),
    Dino(name: "Велоцираптор", type: .predator, image: ""),

  ]
  
  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Go to Detail", for: .normal)
    button.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .insetGrouped)
    table.backgroundColor = .black
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupHeaderStyle()
    
    view.addSubview(tableView)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DinoCell")
    tableView.dataSource = self
    tableView.delegate = self
    setupLayout()
    
  }
  
  @objc func goToDetail() {
    navigationController?.pushViewController(DetailViewController(), animated: true)
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

    ])
  }
  
  func setupHeaderStyle() {
    view.backgroundColor = .purple
    navigationItem.title = "Террариум"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.tintColor = .white
  }
}

extension TableViewController {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dinos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DinoCell", for: indexPath)
    cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
    let dino = dinos[indexPath.row]
    var content = cell.defaultContentConfiguration()
    content.text = dino.name
    content.secondaryText = dino.type.rawValue
    content.image = UIImage(named: "dino_icon")
    content.textProperties.color = .white
    content.secondaryTextProperties.color = .white
    cell.contentConfiguration = content
    return cell
  }
}
