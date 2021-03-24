//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Carlos Alberto Savi on 18/03/21.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
    
        return dateFormatter
    }()
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }

    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        
        print("DONE TAPPED")
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("email: \(email)")
        print("checkIn: \(checkInDate)")
        print("checkOut: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define limites dos Date Picker
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday

        // Atualiza controles na tela
        updateDateViews()
        updateNumberOfGuests()
    }
    
    // MARK: - My Funtions
    func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        // Atualiza labels com as datas dos pickers
        checkInDateLabel.text = dateFormatter.string(from:
                                                        checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from:
                                                        checkOutDatePicker.date)
        
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text =
            "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text =
            "\(Int(numberOfChildrenStepper.value))"
    }

    
    // MARK: - Delegates
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case checkInDatePickerCellIndexPath where
                isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where
                isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath == checkInDateLabelCellIndexPath &&
               isCheckOutDatePickerVisible == false {
                // check-in label selected, check-out picker is not                  visible, toggle check-in picker
                isCheckInDatePickerVisible.toggle()
            } else if indexPath == checkOutDateLabelCellIndexPath &&
               isCheckInDatePickerVisible == false {
                // check-out label selected, check-in picker is not                    visible, toggle check-out picker
                isCheckOutDatePickerVisible.toggle()
            } else if indexPath == checkInDateLabelCellIndexPath ||
               indexPath == checkOutDateLabelCellIndexPath {
                // either label was selected, previous conditions failed                    meaning at least one picker is visible, toggle both
                isCheckInDatePickerVisible.toggle()
                isCheckOutDatePickerVisible.toggle()
            } else {
                return
            }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
