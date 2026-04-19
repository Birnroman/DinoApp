import UIKit

class TableViewController: UIViewController {
  
  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Go to Detail", for: .normal)
    button.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupHeaderStyle()
    
    view.addSubview(button)
    setupLayout()
  }
  
  @objc func goToDetail() {
    navigationController?.pushViewController(DetailViewController(), animated: true)
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
