//
//  ViewController.swift
//  TipCalculator
//
//  Created by Evelyn GAO on 8/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmountTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var OutputCardView: UIView!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    @IBOutlet weak var inputCardView: UIView!
    
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var tipOne = 0.15
    var tipTwo = 0.18
    var tipThree = 0.20
    
    var isDefaultStatusBar = true

    // 2
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setTheme(isDark: false)

    }
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        clear()
    }
    
 
    
    @IBAction func calculateTip(_ sender: Any) {
            // Get bill amount input from text field
            let bill = Double(BillAmountTextField.text!) ?? 0
            
            // Get total tip by multiplying tip * tipPercentage
      
            
            let tipPecentage = [tipOne, tipTwo, tipThree]
      
            let tip = bill * tipPecentage[tipPercentSegmentedControl.selectedSegmentIndex]
            let total = bill + tip

            // Update Tip Amount Label
            tipAmountLabel.text = String(format: "$%.2f", tip)
            // Update total Amount
            totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
    func clear() {
        BillAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }
    
    func setupViews() {
        // nothing yet
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        
        OutputCardView.layer.cornerRadius = 8
        OutputCardView.layer.masksToBounds = true
        
        OutputCardView.layer.borderWidth = 1
        OutputCardView.layer.borderColor = UIColor.systemPink.cgColor


        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light

        view.backgroundColor = theme.viewControllerBackgroundColor

        headerView.backgroundColor = theme.primaryColor
        titleLabel.textColor = theme.primaryTextColor

        inputCardView.backgroundColor = theme.secondaryColor

        BillAmountTextField.textColor = theme.accentColor
        tipPercentSegmentedControl.selectedSegmentTintColor = theme.accentColor

        OutputCardView.backgroundColor = theme.primaryColor
        OutputCardView.layer.borderColor = theme.accentColor.cgColor

            tipAmountTitleLabel.textColor = theme.primaryTextColor
            totalAmountTitleLabel.textColor = theme.primaryTextColor

            tipAmountLabel.textColor = theme.outputTextColor
            totalAmountLabel.textColor = theme.outputTextColor

            resetButton.backgroundColor = theme.secondaryColor
        isDefaultStatusBar = theme.isDefaultStatusBar
            setNeedsStatusBarAppearanceUpdate()

    }
    
    
    
}

