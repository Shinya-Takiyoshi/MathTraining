//
//  ResultViewController.swift
//  MathTraining
//
//  Created by 滝吉慎也 on 2020/04/21.
//  Copyright © 2020 滝吉慎也. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = 0.0
    @IBOutlet var resultLabel:UILabel!
    @IBOutlet var mssagaLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "\(round(result))%"
        if result < 50{
            mssagaLabel.text = "PLEASE TRY AGAIN!"
        }else if result < 80{
            mssagaLabel.text = "NICE!"
        }else{
            mssagaLabel.text = "YOU ARE GREAT!"
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
