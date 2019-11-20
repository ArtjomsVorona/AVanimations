//
//  ButtonAnimationViewController.swift
//  AVanimations
//
//  Created by Artjoms Vorona on 20/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class ButtonAnimationViewController: UIViewController {
    
    let animationOptions = AnimationOptions.shared.animationOptions
    let animationOptionsDict = AnimationOptions.shared.animationOptionsDict

    var centerXinitialValue: CGFloat!
    var centerYinitialValue: CGFloat!
    
    var duration: Double!
    var firstCenterXmove: CGFloat!
    var firstCenterYmove: CGFloat!
    var secondCenterXmove: CGFloat!
    var secondCenterYmove: CGFloat!
    
    var selectedAnimationOption: UIView.AnimationOptions!
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var firstMoveCenterXlabel: UILabel!
    @IBOutlet weak var firstMoveCenterYlabel: UILabel!
    @IBOutlet weak var secondMoveCenterXlabel: UILabel!
    @IBOutlet weak var secondMoveCenterYlabel: UILabel!
    
    @IBOutlet weak var durationStepper: UIStepper!
    @IBOutlet weak var firstMoveCenterXslider: UISlider!
    @IBOutlet weak var firstMoveCenterYslider: UISlider!
    @IBOutlet weak var secondMoveCenterXslider: UISlider!
    @IBOutlet weak var secondMoveCenterYslider: UISlider!
    
    @IBOutlet weak var animationOptionPicker: UIPickerView!
    
    @IBOutlet weak var startAnimateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerXinitialValue = startAnimateButton.center.x
        centerYinitialValue = startAnimateButton.center.y
        
        returnToDefaultValues()
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        returnToDefaultValues()
    }
    
    @IBAction func durationStepperChanged(_ sender: UIStepper) {
        duration = sender.value / 10
        updateLabels()
    }
    
    @IBAction func firstCenterXmoveSliderChanged(_ sender: UISlider) {
        firstCenterXmove = CGFloat(sender.value)
        updateLabels()
    }
    
    @IBAction func firstCenterYmoveSliderChanged(_ sender: UISlider) {
        firstCenterYmove = CGFloat(sender.value)
        updateLabels()
    }
    
    @IBAction func secondCenterXmoveSliderChanged(_ sender: UISlider) {
        secondCenterXmove = CGFloat(sender.value)
        updateLabels()
    }
    
    @IBAction func secondCenterYmoveSliderChanged(_ sender: UISlider) {
        secondCenterYmove = CGFloat(sender.value)
        updateLabels()
    }

    @IBAction func startAnimateButtonTapped(_ sender: UIButton) {
         UIView.animate(withDuration: duration, delay: 0.0, options: [selectedAnimationOption], animations: {
                sender.center.x += self.firstCenterXmove
                sender.center.y += self.firstCenterYmove
            }, completion: nil)
        UIView.animate(withDuration: duration, delay: 0.5, options: [selectedAnimationOption], animations: {
            sender.center.x += self.secondCenterXmove
            sender.center.y += self.secondCenterYmove
        }, completion: nil)
    }
    
    func returnToDefaultValues() {
        duration = 1.0
        durationStepper.value = duration * 10
        
        firstCenterXmove = 0
        firstMoveCenterXslider.value = Float(firstCenterXmove)
        
        secondCenterXmove = 0
        secondMoveCenterXslider.value = Float(secondCenterXmove)
        
        firstCenterYmove = -50
        firstMoveCenterYslider.value = Float(firstCenterYmove)
        
        secondCenterYmove = 50
        secondMoveCenterYslider.value = Float(secondCenterYmove)
        
        startAnimateButton.center.x = centerXinitialValue
        startAnimateButton.center.y = centerYinitialValue
        
        let index = 1
        let animation = animationOptions[index]
        selectedAnimationOption = animationOptionsDict[animation]
        animationOptionPicker.selectRow(index, inComponent: 0, animated: true)
        
        updateLabels()
    }
    
    func updateLabels() {
        durationLabel.text = "Duration: \(duration!) seconds"
        firstMoveCenterXlabel.text = "Center X move: \(Int(firstCenterXmove!)) points"
        firstMoveCenterYlabel.text = "Center Y move: \(Int(firstCenterYmove!)) points"
        
        secondMoveCenterXlabel.text = "Center X move: \(Int(secondCenterXmove!)) points"
        secondMoveCenterYlabel.text = "Center Y move: \(Int(secondCenterYmove!)) points"
    }

}//end class


extension ButtonAnimationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        animationOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        animationOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let animation = animationOptions[row]
        selectedAnimationOption = animationOptionsDict[animation]
    }
    
}
