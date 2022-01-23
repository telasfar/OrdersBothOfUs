//
//  CustomSegmented.swift
//  Arkan
//
//  Created by BinaryCase on 12/24/18.
//  Copyright © 2018 Tariq. All rights reserved.
//

import UIKit

class CustomSegmented: UISegmentedControl {

    //vars
    var buttonBar = UIView()
    var barButtonLeadingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.gray
            ], for: .normal)
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font :UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .selected)
        
        createSegmentedHighLight()
    }
    
    func createSegmentedHighLight(){
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(buttonBar)
        // buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        buttonBar.topAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
//        if Language.currentLanguage == .arabic {
//            self.barButtonLeadingConstraint =  buttonBar.rightAnchor.constraint(equalTo:segmntedControl.rightAnchor)
//        }else{
            self.barButtonLeadingConstraint =  buttonBar.leftAnchor.constraint(equalTo:leftAnchor)
       // }
        
        
        self.barButtonLeadingConstraint.constant = ((frame.width) / CGFloat(numberOfSegments)) * CGFloat(0) //3ashan yo2of 3and arkani
        
        self.barButtonLeadingConstraint.isActive = true
        buttonBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / CGFloat(numberOfSegments)).isActive = true
    }
    
    func animateSegmented(){
        UIView.animate(withDuration: 0.3) {
            self.barButtonLeadingConstraint.constant = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
            self.layoutIfNeeded()
        }
    }
}
