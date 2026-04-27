
import UIKit

class HelpViewController: UIViewController {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Какие варианты?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут всё нехитро"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkBackgound
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(mainStack)

        setupListData()
        setupLayout()
    }
    
    func createListRow(number: String, text: String) -> UIView {
        let circleView = UIView()
        circleView.backgroundColor = UIColor.buttonSecondary
        circleView.layer.cornerRadius = 24
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        numberLabel.textColor = .white
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        circleView.addSubview(numberLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = text
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let rowStack = UIStackView(arrangedSubviews: [circleView, descriptionLabel])
        rowStack.axis = .horizontal
        rowStack.spacing = 16
        rowStack.alignment = .center
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.heightAnchor.constraint(equalToConstant: 44),
            circleView.widthAnchor.constraint(equalToConstant: 44),
            numberLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),

        ])
        
        return rowStack
    }
    
    func setupListData() {
        let firstRow = createListRow(number: "1", text: "Если выбрать таблицу, вы перейдете в Террариум, откуда можно посмотреть  детали")
        let secondRow = createListRow(number: "2", text: "Если выбрать коллекцию, вы перейдете в Галерею, откуда по клику снова на страницу с подробностями")

        mainStack.addArrangedSubview(firstRow)
        mainStack.addArrangedSubview(secondRow)

    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            mainStack.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
}
