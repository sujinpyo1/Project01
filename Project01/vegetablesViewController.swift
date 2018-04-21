//
//  vegetablesViewController.swift
//  Project01
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class vegetablesViewController: UIViewController, UITextFieldDelegate {
    
    // 아울렛 선언
    @IBOutlet var vegetableImageView: UIImageView!
    @IBOutlet var beanButton: UIButton!
    @IBOutlet var carrotButton: UIButton!
    @IBOutlet var cucumberButton: UIButton!
    @IBOutlet var eggplantButton: UIButton!
    @IBOutlet var answerView: UIView!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var finishBackground: UIImageView!
    @IBOutlet var finishView: UIView!
    
    // 각 변수마다 이미지를 선언해줌
    let beanImage = UIImage(named: "bean.png")
    let beanShadeImage = UIImage(named: "beanShade.png")
    let carrotImage = UIImage(named: "carrot.png")
    let carrotShadeImage = UIImage(named: "carrotShade.png")
    let cucumberImage = UIImage(named: "cucumber.png")
    let cucumberShadeImage = UIImage(named: "cucumberShade.png")
    let eggplantImage = UIImage(named: "eggplant.png")
    let eggplantShadeImage = UIImage(named: "eggplantShade.png")
    var imageInt = 0 // 이미지에 상수를 할당해줌
    
    override func viewDidLoad() { // 처음 시작되는 상태
        super.viewDidLoad()
        vegetableImageView.image = beanShadeImage // 초기 그림자 이미지
        // 정답 창과 다음 문제로 가는 버튼을 숨겨놓음
        answerView.isHidden = true
        nextButton.isHidden = true
        
        imageInt = 1
        
        // 문제가 끝나고 난 뒤에 축하해주는 부분을 숨겨놓음
        finishView.isHidden = true
        finishBackground.isHidden = true

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        wordLabel.text = answerTextField.text // textfield에서 입력한 값을 wordLabel에 전달함
        return true
    }
    
    var vegetableName: String! // 각 버튼마다 String 타입으로 선언한 이름을 지정해줌
    
    // 그림 버튼을 누를 때 일어나는 이벤트 함수
    @IBAction func chooseButton(_ sender: UIButton) {
        // 야채이미지뷰에 콩의 그림자이미지가 나타났을 때
        if vegetableImageView.image == beanShadeImage {
            if beanButton.isTouchInside { // 콩 이미지 버튼을 누르면
                vegetableImageView.image = beanImage // 그림자 이미지 -> 그림 이미지
                answerView.isHidden = false // 정답 창이 보이게 됨
                vegetableName = "콩"
            }
        } else if vegetableImageView.image == carrotShadeImage { // 야채이미지뷰에 당근의 그림자이미지가 나타났을 때
            if carrotButton.isTouchInside {
                vegetableImageView.image = carrotImage
                answerView.isHidden = false
                vegetableName = "당근"
            }
        } else if vegetableImageView.image == cucumberShadeImage { // 야채이미지뷰에 오이의 그림자이미지가 나타났을 때
            if cucumberButton.isTouchInside {
                vegetableImageView.image = cucumberImage
                answerView.isHidden = false
                vegetableName = "오이"
            }
        } else if vegetableImageView.image == eggplantShadeImage { // 야채이미지뷰에 가지의 그림자이미지가 나타났을 때
            if eggplantButton.isTouchInside {
                vegetableImageView.image = eggplantImage
                answerView.isHidden = false
                vegetableName = "가지"
            }
        }
    }
    // 답을 작성하고 확인하는 버튼의 이벤트 함수
    @IBAction func checkButton(_ sender: UIButton) {
        if answerTextField.text == vegetableName { // textfield에서 작성한 값과 각각의 버튼에 할당된 문자의 값이 같을 때
            nextButton.isHidden = false // 다음 문제로 이동하라는 버튼이 보임
        }
    }
    // 그림자 이미지 함수
    func shadeImage() {
        if imageInt == 1 { // int값이 1일 때
            vegetableImageView.image = beanShadeImage // 야채 이미지 뷰의 이미지를 콩의 그림자 이미지로 지정함
        } else if imageInt == 2 { // int값이 2일 때
            vegetableImageView.image = carrotShadeImage // 야채 이미지 뷰의 이미지를 당근의 그림자 이미지로 지정함
        } else if imageInt == 3 { // int값이 3일 때
           vegetableImageView.image = cucumberShadeImage // 야채 이미지 뷰의 이미지를 오이의 그림자 이미지로 지정함
        } else if imageInt == 4 { // int값이 4일 때
            vegetableImageView.image = eggplantShadeImage // 야채 이미지 뷰의 이미지를 가지의 그림자 이미지로 지정함
        } else { // 문제가 다 끝나면 축하해주는 뷰가 보이도록 함
            finishView.isHidden = false
            finishBackground.isHidden = false
            
        }
    }
    
    // 다음 문제로 가는 버튼을 눌렀을 때 발생하는 이벤트 함수
    @IBAction func toNextButton(_ sender: UIButton) {
        // 다음으로 가는 버튼과 답안 작성 창을 안보이게 해줌
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
