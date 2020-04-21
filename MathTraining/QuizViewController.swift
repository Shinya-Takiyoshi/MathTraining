//
//  QuizViewController.swift
//  MathTraining
//
//  Created by 滝吉慎也 on 2020/04/20.
//  Copyright © 2020 滝吉慎也. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    let total = 10 //問題数
    var correct = 0 //正解数
    var questionIndex = 0 //問題の番号
    var answerIndex = 0 //正解の番号
    
    @IBOutlet var LeftNumberLabel :UILabel!
    @IBOutlet var centerNumberLabel :UILabel!
    @IBOutlet var rightNumberLabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuestion()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as?ResultViewController{
            resultVC.result = Double(correct) / Double(total) * 100.0
        }
    }
    
    @IBAction func tapped(sender :UIButton){
        if sender.tag - 1 == answerIndex {
            correct += 1
        }
        questionIndex += 1
        if questionIndex >= total{
            performSegue(withIdentifier: "quizToReselt", sender: nil)
        }else{
            setQuestion()
        }
    }
    
    func setQuestion(){
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))
        answerIndex = Int(arc4random_uniform(4))
        switch answerIndex{
            case 0:
                rightNumberLabel.text = "\(leftNum + centerNum)"
            case 1:
                rightNumberLabel.text = "\(leftNum - centerNum)"
            case 2:
                rightNumberLabel.text = "\(leftNum * centerNum)"
            default:
                if centerNum == 0 {
                    centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        LeftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
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
