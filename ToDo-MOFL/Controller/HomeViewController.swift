//
//  ViewController.swift
//  ToDo-MOFL
//
//  Created by Naman Singh on 31/05/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var tomorrowView: UIView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bgView.makeTopCornersRounded()
        setupViews()
    }
    
    @IBAction func todayButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "ViewControllerToTodayViewController", sender: PriorityEnum.today)
    }
    
    @IBAction func tomorrowButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "ViewControllerToTodayViewController", sender: PriorityEnum.tomorrow)
    }
    
    @IBAction func upcomingButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "ViewControllerToTodayViewController", sender: PriorityEnum.upcoming)
    }
    
    
    func setupViews() {
        todayView.layer.cornerRadius = 10.0
        tomorrowView.layer.cornerRadius = 10.0
        upcomingView.layer.cornerRadius = 10.0
        
        todayLabel.text = "Today's Task"
        todayLabel.textColor = .white
        
        tomorrowLabel.text = "Tomorrow's Task"
        tomorrowLabel.textColor = .white
        
        upcomingLabel.text = "Upcoming Task"
        upcomingLabel.textColor = .white
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "ViewControllerToTodayViewController":
            guard let controller = segue.destination as? TodayViewController, let priority = sender as? PriorityEnum  else {return}
            controller.priority = priority
        default:
            break
        }
    }
 
}


extension UIView {
    func makeTopCornersRounded(radius: CGFloat = 26) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
