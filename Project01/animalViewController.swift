//
//  animalViewController.swift
//  Project01
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class animalViewController: UIViewController, UITextFieldDelegate {
    // 아울렛 설정
    @IBOutlet var animalImageView: UIImageView!
    @IBOutlet var catButton: UIButton!
    @IBOutlet var dogButton: UIButton!
    @IBOutlet var pigButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    @IBOutlet var answerView: UIView!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var finishBackground: UIImageView!
    @IBOutlet var finishView: UIView!
    
    // 각 변수마다 이미지를 선언해줌
    let catImage = UIImage(named: "cat.png")
    let catShadeImage = UIImage(named: "catShade.png")
    let dogImage = UIImage(named: "dog.png")
    let dogShadeImage = UIImage(named: "dogShade.png")
    let pigImage = UIImage(named: "pig.png")
    let pigShadeImage = UIImage(named: "pigShade.png")
    let rabbitImage = UIImage(named: "rabbit.png")
    let rabbitShadeImage = UIImage(named: "rabbitShade.png")
    
     var imageInt = 0 // 이미지에 상수를 할당해줌
    
    
    override func viewDidLoad() { // 처음 시작되는 상태
        

        super.viewDidLoad()
        animalImageView.image = catShadeImage
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
    
    var animalName: String! // 각 버튼마다 String 타입으로 선언한 이름을 지정해줌
    // 그림 버튼을 누를 때 일어나는 이벤트 함수
    @IBAction func chooseButton(_ sender: UIButton) {
         // 해양동물 이미지뷰에 문어의 그림자 이미지가 나타났을 때
        if animalImageView.image == catShadeImage { // 고양이 이미지 버튼을 누르면
            if catButton.isTouchInside {
                animalImageView.image = catImage // 그림자 이미지 -> 그림 이미지
                answerView.isHidden = false // 정답 창이 보이게 됨
                animalName = "고양이"
            }
        } else if animalImageView.image == dogShadeImage {
            if dogButton.isTouchInside {
                animalImageView.image = dogImage
                answerView.isHidden = false
                animalName = "강아지"
            }
        } else if animalImageView.image == pigShadeImage {
            if pigButton.isTouchInside {
                animalImageView.image = pigImage
                answerView.isHidden = false
                animalName = "돼지"
            }
        } else if animalImageView.image == rabbitShadeImage {
            if rabbitButton.isTouchInside {
                animalImageView.image = rabbitImage
                answerView.isHidden = false
                animalName = "토끼"
            }
        }
    }
    // 답을 작성하고 확인하는 버튼의 이벤트 함수
    @IBAction func checkButton(_ sender: UIButton) {
        // textfield에서 작성한 값과 각각의 버튼에 할당된 문자의 값이 같을 때
        if answerTextField.text == animalName {
            nextButton.isHidden = false // 다음 문제로 이동하라는 버튼이 나타남
        }
    }
    // 그림자 이미지 함수
    func shadeImage() {
        if imageInt == 1 {
            animalImageView.image = catShadeImage // 동물 이미지 뷰의 이미지를 고양이의 그림자 이미지로 지정함
        } else if imageInt == 2 {
            animalImageView.image = dogShadeImage // 동물 이미지 뷰의 이미지를 강아지의 그림자 이미지로 지정함
        } else if imageInt == 3 {
            animalImageView.image = pigShadeImage // 동물 이미지 뷰의 이미지를 돼지의 그림자 이미지로 지정함
        } else if imageInt == 4 {
            animalImageView.image = rabbitShadeImage // 동물 이미지 뷰의 이미지를 토끼의 그림자 이미지로 지정함
        } else { // 문제가 다 끝나면 축하해주는 뷰가 보이도록 함
            finishBackground.isHidden = false
            finishView.isHidden = false
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
