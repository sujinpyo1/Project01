//
//  seaAnimalViewController.swift
//  Project01
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class seaAnimalViewController: UIViewController, UITextFieldDelegate {
    
    // 아울렛 선언
    @IBOutlet var seaAnimalImageView: UIImageView!
    @IBOutlet var octopusButton: UIButton!
    @IBOutlet var turtleButton: UIButton!
    @IBOutlet var seaHorseButton: UIButton!
    @IBOutlet var sharkButton: UIButton!
    @IBOutlet var answerView: UIView!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var finishView: UIView!
    @IBOutlet var finishBackground: UIImageView!
    
    // 각 변수마다 이미지를 선언해줌
    let octopusImage = UIImage(named: "octopus.png")
    let octopusShadeImage = UIImage(named: "octopusShade.png")
    let turtleImage = UIImage(named: "turtle.png")
    let turtleShadeImage = UIImage(named: "turtleShade.png")
    let seahorseImage = UIImage(named: "seahorse.png")
    let seahorseShadeImage = UIImage(named: "seahorseShade.png")
    let sharkImage = UIImage(named: "shark.png")
    let sharkShadeImage = UIImage(named: "sharkShade.png")
    
    var imageInt = 0 // 이미지에 상수를 할당해줌

    override func viewDidLoad() { // 처음 시작되는 상태
        super.viewDidLoad()
        seaAnimalImageView.image = octopusShadeImage // 초기 그림자 이미지
        // 정답 창과 다음 문제로 가는 버튼을 숨겨놓음
        answerView.isHidden = true
        nextButton.isHidden = true
        
        imageInt = 1
        
        // 문제가 끝나고 난 뒤에 축하해주는 부분을 숨겨놓음
        finishView.isHidden = true
        finishBackground.isHidden = true
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        wordLabel.text = answerTextField.text // textfield에서 입력한 값을 wordLabel에 전달함
        return true
    }
    
    var seaAnimalName:String! // 각 버튼마다 String 타입으로 선언한 이름을 지정해줌
    
    // 그림 버튼을 누를 때 일어나는 이벤트 함수
    @IBAction func chooseButton(_ sender: UIButton) {
       
        // 해양동물 이미지뷰에 문어의 그림자 이미지가 나타났을 때
        if seaAnimalImageView.image == octopusShadeImage {
            if octopusButton.isTouchInside { // 문어 이미지 버튼을 누르면
                seaAnimalImageView.image = octopusImage  // 그림자 이미지 -> 그림 이미지
                answerView.isHidden = false // 정답 창이 보이게 됨
                seaAnimalName = "문어"
                
                
            } 
        } else if seaAnimalImageView.image == turtleShadeImage {  // 해양 동물 이미지뷰에 거북이의 그림자이미지가 나타났을 때
            if turtleButton.isTouchInside {
                seaAnimalImageView.image = turtleImage
                answerView.isHidden = false
                seaAnimalName = "거북이"
               
                
            }
        } else if seaAnimalImageView.image == seahorseShadeImage { // 해양 동물 이미지뷰에 해마의 그림자이미지가 나타났을 때
            if seaHorseButton.isTouchInside {
                seaAnimalImageView.image = seahorseImage
                answerView.isHidden = false
                seaAnimalName = "해마"
              
                
            }
        } else if seaAnimalImageView.image == sharkShadeImage { // 해양 동물 이미지뷰에 상어의 그림자이미지가 나타났을 때
            if sharkButton.isTouchInside {
                seaAnimalImageView.image = sharkImage
                answerView.isHidden = false
                seaAnimalName = "상어"
                
                
            }
        }
    }
    // 답을 작성하고 확인하는 버튼의 이벤트 함수
    @IBAction func checkButton(_ sender: UIButton) {
        // textfield에서 작성한 값과 각각의 버튼에 할당된 문자의 값이 같을 때
        if answerTextField.text == seaAnimalName {
            nextButton.isHidden = false // 다음 문제로 이동하라는 버튼이 나타남
        }
    }
    // 그림자 이미지 함수
    func shadeImage() {
        if imageInt == 1 {
            seaAnimalImageView.image = octopusShadeImage // 해양동물 이미지 뷰의 이미지를 문어의 그림자 이미지로 지정함
        } else if imageInt == 2 {
            seaAnimalImageView.image = turtleShadeImage // 해양동물 이미지 뷰의 이미지를 거북이의 그림자 이미지로 지정함
        } else if imageInt == 3 {
            seaAnimalImageView.image = seahorseShadeImage // 해양동물 이미지 뷰의 이미지를 해마의 그림자 이미지로 지정함
        } else if imageInt == 4 {
            seaAnimalImageView.image = sharkShadeImage // 해양동물 이미지 뷰의 이미지를 상어의 그림자 이미지로 지정함
            
        } else { // 문제가 다 끝나면 축하해주는 뷰가 보이도록 함
            finishView.isHidden = false
            finishBackground.isHidden = false
           
        }
    }
    // 다음 문제로 가는 버튼을 눌렀을 때 발생하는 이벤트 함수
    @IBAction func toNextButton(_ sender: UIButton) {
        nextButton.isHidden = true
        answerView.isHidden = true
        // textfield와 label의 값을 초기화 해줌

        wordLabel.text = ""
        answerTextField.text = ""
    
        // 누를 때마다 int값이 하나씩 상승
        imageInt += 1
        self.shadeImage()
        
    
    }
    
}
