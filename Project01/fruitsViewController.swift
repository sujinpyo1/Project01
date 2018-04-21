//
//  fruitsViewController.swift
//  Project01
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class fruitsViewController: UIViewController, UITextFieldDelegate {
    // 아울렛 선언
    @IBOutlet var fruitImageView: UIImageView!
    @IBOutlet var appleButton: UIButton!
    @IBOutlet var bananaButton: UIButton!
    @IBOutlet var strawberryButton: UIButton!
    @IBOutlet var grapeButton: UIButton!
    @IBOutlet var answerView: UIView!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var finishBackground: UIImageView!
    @IBOutlet var finishView: UIView!
    
    // 각 변수마다 이미지를 선언해줌
    let appleImage = UIImage(named: "apple.png")
    let appleShadeImage = UIImage(named: "appleShade.png")
    let bananaImage = UIImage(named: "banana.png")
    let bananaShadeImage = UIImage(named: "bananaShade.png")
    let strawberryImage = UIImage(named: "strawberry.png")
    let strawberryShadeImage = UIImage(named: "strawberryShade.png")
    let grapeImage = UIImage(named: "grape.png")
    let grapeShadeImage = UIImage(named: "grapeShade.png")
    var imageInt = 0 // 이미지에 상수를 할당해줌
    

    override func viewDidLoad() { // 처음 시작되는 상태
        super.viewDidLoad()
        fruitImageView.image = appleShadeImage // 초기 그림자 이미지
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
    
    var fruitName: String! // 각 버튼마다 String 타입으로 선언한 이름을 지정해줌
    
    // 그림 버튼을 누를 때 일어나는 이벤트 함수
    @IBAction func chooseButton(_ sender: UIButton) {
         // 과일 이미지뷰에 사과의 그림자이미지가 나타났을 때
        if fruitImageView.image == appleShadeImage {
            if appleButton.isTouchInside { // 사과 이미지 버튼을 누르면
                fruitImageView.image = appleImage // 그림자 이미지 -> 그림 이미지
                answerView.isHidden = false // 정답 창이 보이게 됨
                fruitName = "사과"
                
            }
        } else if fruitImageView.image == bananaShadeImage {  // 과일 이미지뷰에 바나나의 그림자이미지가 나타났을 때
            if bananaButton.isTouchInside {
                fruitImageView.image = bananaImage
                answerView.isHidden = false
                fruitName = "바나나"
            }
        } else if fruitImageView.image == strawberryShadeImage {  // 과일 이미지뷰에 딸기의 그림자이미지가 나타났을 때
            if strawberryButton.isTouchInside {
                fruitImageView.image = strawberryImage
                answerView.isHidden = false
                fruitName = "딸기"
            }
        } else if fruitImageView.image == grapeShadeImage {  // 과일 이미지뷰에 포도의 그림자이미지가 나타났을 때
            if grapeButton.isTouchInside {
                fruitImageView.image = grapeImage
                answerView.isHidden = false
                fruitName = "포도"
            }
        }
    }
    // 답을 작성하고 확인하는 버튼의 이벤트 함수
    @IBAction func checkButton(_ sender: UIButton) {
        if answerTextField.text == fruitName { // textfield에서 작성한 값과 각각의 버튼에 할당된 문자의 값이 같을 때
            nextButton.isHidden = false  // 다음 문제로 이동하라는 버튼이 보임
        }
    }
    // 그림자 이미지 함수
    func shadeImage() {
        if imageInt == 1 { // int값이 1일때
            fruitImageView.image = appleShadeImage //과일 이미지 뷰의 이미지를 사과의 그림자 이미지로 지정함
        } else if imageInt == 2 { // int값이 2일때
            fruitImageView.image = bananaShadeImage //과일 이미지 뷰의 이미지를 바나나의 그림자 이미지로 지정함
        } else if imageInt == 3 { // int값이 3일때
            fruitImageView.image = strawberryShadeImage //과일 이미지 뷰의 이미지를 딸기의 그림자 이미지로 지정함
        } else if imageInt == 4 { // int값이 4일때
            fruitImageView.image = grapeShadeImage } //과일 이미지 뷰의 이미지를 포도의 그림자 이미지로 지정함
        else {  // 문제가 다 끝나면 축하해주는 뷰가 보이도록 함
            finishView.isHidden = false
            finishBackground.isHidden = false
            
        }
    }
    
    // 다음 문제로 가는 버튼을 눌렀을 때 발생하는 이벤트 함수
    @IBAction func toNextButton(_ sender: UIButton) {
        nextButton.isHidden = true
        answerView.isHidden = true
        wordLabel.text = ""
        answerTextField.text = ""
        
        imageInt += 1
        self.shadeImage()
   
    }
    
    

}
