//
//  ViewController.swift
//  Swift4_part3_views
//
//  Created by Admin on 23/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackBottomCons: NSLayoutConstraint!
    private var isMenuOpen = false;
    @IBOutlet weak var menuViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuLabel: UIButton!;
    @IBOutlet weak var menuView : UIView!;
    @IBOutlet weak var stackView: UIStackView!;
    @IBOutlet weak var statementLabel: UILabel!;
    @IBOutlet weak var newStatementLabel: UILabel!;
    @IBOutlet weak var oldLabelXConstraint: NSLayoutConstraint!;
    @IBOutlet weak var newLabelXCostraint: NSLayoutConstraint!;
    
    @IBAction func buttonClicked(_ sender: UIButton){
        if statementLabel.alpha != 1 {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: .curveEaseIn, animations: {
                self.statementLabel.alpha = 1.0;
                self.newStatementLabel.alpha = 0;
                self.oldLabelXConstraint.constant = 0;
                self.newLabelXCostraint.constant = -self.view.frame.width;
                self.view.layoutIfNeeded();
            }) { (UIViewAnimatingPosition) in
                print(UIViewAnimatingPosition);
            }
        }else{
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: .curveEaseIn, animations: {
                self.statementLabel.alpha = 0;
                self.newStatementLabel.alpha = 1;
                self.oldLabelXConstraint.constant = self.view.frame.width;
                self.newLabelXCostraint.constant = 0;
                self.view.layoutIfNeeded();
            }) { (UIViewAnimatingPosition) in
                print(UIViewAnimatingPosition);
            }
        }
    }
    var icon1: UIView!;
    
    
    @IBAction func labelClicked(_ sender:UIButton){
        print("clicked");
        if !isMenuOpen {
            self.menuViewHeightConstraint.constant = 75;
            self.stackView.spacing = 50.0;
            self.stackBottomCons.constant = 2;
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
                
            }, completion: {finalPosition in
                print("done");
                
            });
            isMenuOpen = true;
        }else{
            self.menuViewHeightConstraint.constant = 50;
            
            self.stackView.spacing = 10.0;
            self.stackBottomCons.constant = -26;

            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
                
            }, completion: {finalPosition in
                print("done");
            });
            isMenuOpen = false;
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        icon1 = UIView();
        icon1.backgroundColor = UIColor.yellow;
        icon1.translatesAutoresizingMaskIntoConstraints = false;
        self.view.bringSubviewToFront(menuView);
        menuView.bringSubviewToFront(menuLabel);
        newLabelXCostraint.constant = -view.frame.width;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

