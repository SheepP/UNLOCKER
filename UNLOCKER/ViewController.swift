//
//  ViewController.swift
//  UNLOCKER
//
//  Created by 鄭羽辰 on 2018/7/24.
//  Copyright © 2018 鄭羽辰. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1
    //原本為取0~99的亂數，+1變成1~100 make a random number，並且在讀入畫面前先取亂數
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    var guessCounting = 0
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
        //讓手機的上方狀態列變為白色，介面好看
    }
    @IBOutlet weak var messagelabel: UILabel!
    
    @IBOutlet weak var guessCount: UILabel!
    
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            //Playing Game
            print(answer)
            
            
            // take input text out
            let inputText = inputTextField.text!
            //拿取文字輸入匡裡面的內容，加驚嘆號是保證輸入有值
            inputTextField.text = nil
            //Clear textfield
            
            let inputNumber = Int(inputText)
            //將Str轉成Int，方便比較，inputNumber為?，因為使用者若輸入文字轉成整數會為nil
            if inputNumber == nil{
                //wrong input
                messagelabel.text = "No input! Guess a number between \(minNumber)~\(maxNumber)"
            }else{
                if inputNumber! > maxNumber || inputNumber! < minNumber{
                    messagelabel.text = "Out of Scope, Guess a number between \(minNumber)~\(maxNumber)"
                }else if inputNumber == answer{
                    guessCounting += 1
                    messagelabel.text = "You are right! Press [Guess] to play again"
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }else{
                    guessCounting += 1
                    if inputNumber! > answer{
                        //larger than answer
                        maxNumber = inputNumber!
                    }else{
                        minNumber = inputNumber!
                    }
                    messagelabel.text = "Try again, guess a number between \(minNumber)~\(maxNumber)"
                    //Check Answer
                }
                print("guess count:\(guessCounting)")
                guessCount.text = "Count : \(guessCounting)"
            }
            
        }else{
            //Game is over
            maxNumber = 100
            minNumber = 1
            messagelabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1
            isOver = false
            guessCounting = 0
            background.image = UIImage(named: "BG")
            guessCount.text = "Count : \(guessCounting)"
            
        }
        
        
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
        //push the keyboard up when app starts
        guessCount.layer.borderWidth = 1
        guessCount.layer.cornerRadius = 5
        //讓計數的匡有圓角與邊筐線

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

