import UIKit

extension UIColor {
    static var random: UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

let color = UIColor.red
print(color)

let newColor = UIColor.random
print(newColor)

// Uma extensão para validar os requisitos de uma senha
extension String {
    init?(passwordSafeString: String) {
        guard passwordSafeString.rangeOfCharacter(from: .uppercaseLetters)
                != nil &&
                passwordSafeString.rangeOfCharacter(from: .lowercaseLetters)
                != nil &&
                passwordSafeString.rangeOfCharacter(from: .punctuationCharacters)
                != nil &&
                passwordSafeString.rangeOfCharacter(from: .decimalDigits)
                != nil &&
                passwordSafeString.count > 5
        else {
            return nil
        }
        
        self = passwordSafeString
    }
}
let safeString = String.init(passwordSafeString: "aB1;a")


// Extensão para reorganizar código
class EmployeeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

extension EmployeeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Datasource da Table View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    // EmployeeViewController implementation methods ...
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
