//
//  ViewController.swift
//  Project01
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
// 피커뷰를 사용하기 위해 UIPickerViewDelegate, UIPickerViewDataSource 선언
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // 아울렛 설정
    @IBOutlet var choosePicker: UIPickerView!
    // 피커 뷰의 배열 선언
    let pickerArray: Array<String> = ["육지 동물", "바다 동물", "과일", "채소"]
    var chosenState = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 몇개의 컴포넌트를 사용할 것인지 설정
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 각 컴포넌트당 몇개의 데이터가 있는지 설정
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
        
    }
    // 선택한 항목이 무슨 타입인지 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
        
    }
    // 여러 개의 뷰를 연결하기 위해서 사용하는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenState = pickerArray[row]
    }
    // 시작하기 버튼을 눌렀을 때 실행되는 이벤트 함수
    @IBAction func startButtonPressed(_ sender: Any) {
        let pIndex = choosePicker.selectedRow(inComponent: 0) // 피커 뷰의 선택된 줄에서 가져온 인덱스 값을 선언해줌
        
        if pIndex == 0 { // 인덱스 값이 0일때
            self.performSegue(withIdentifier: "toAnimalView", sender: nil) // toAnimalView segue로 이동
        } else if pIndex == 1 { // 인덱스 값이 1일때
            self.performSegue(withIdentifier: "toSeaAnimalView", sender: nil) // toSeaAnimalView segue로 이동
        } else if pIndex == 2 { // 인덱스 값이 2일때
            self.performSegue(withIdentifier: "toFruitView", sender: nil) // toFruitView segue로 이동
        } else if pIndex == 3 { // 인덱스 값이 3일때
            self.performSegue(withIdentifier: "toVegetableView", sender: nil) // toVegetableView segue로 이동
        }

    }
    
    
    
   
    


}

