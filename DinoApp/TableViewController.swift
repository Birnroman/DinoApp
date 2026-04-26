import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dinos = DinoService.sharedDinos
    
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .black
        table.separatorStyle = .singleLine
        table.separatorColor = UIColor(white: 1, alpha: 0.2)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(DinoTableViewCell.self, forCellReuseIdentifier: DinoTableViewCell.reuseIdenifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderStyle()

        view.addSubview(tableView)
        setupLayout()
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
        navigationItem.title = "Террариум"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
}

extension TableViewController  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dinos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DinoTableViewCell.reuseIdenifier, for: indexPath) as! DinoTableViewCell
        cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
        let dino = dinos[indexPath.row]
        cell.configureCell(with: dino)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailViewController()
        detailController.dino = dinos[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }
}


