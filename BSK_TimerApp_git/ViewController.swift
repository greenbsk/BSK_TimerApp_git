//
//  ViewController.swift
//  BSK_timerApp
//
//  Created by BS K on 2023/02/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    weak var timer: Timer?
    var number : Int = 0
    var minute : Int = 0
    var seconds : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
       
    }
    
    func setUp() {
        mainLabel.text = " 선택하세요. "
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
       // let minute = Int(slider.value * )
        //슬라이더의 밸류가 0~1인데 우리는 0~60으로 나타내고싶으니까.
       seconds = Int(slider.value * 300)
        
        // 슬라이더가 바뀜에 따라서 슬라이더가 줄고 남은 초수를 알려준다.
        //mainLabel.text = "\(seconds)초"
        number = seconds
        
        
        minute = number / 60
        seconds = number % 60
        
        if minute >= 1 {
            mainLabel.text = "\(minute)분 \(seconds)초"
        } else {
            mainLabel.text = "\(seconds)초"
        }
        
        //슬라이더의 밸류값을 가지고 메인레이블의 텍스트가 변하게 세팅.
        
    }
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //스타트 버튼 누르면 슬라이더가 줄고 남은 초수를 알려준다.
        
        //시간이 흐르도록 만들기 / 시간이 지나갈 때마다 실행.
        
        timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            
            minute = number / 60
            seconds = number % 60
            
            if number > 1 {
                //slider.value = Float(number) - 1
               number -= 1
                // minute -= 1
                slider.value = Float(number) / Float(300)
//                minute = number / 60
//                seconds = number % 60
                mainLabel.text = "\(minute)분 \(number)초"
                
            } else {
                number = 0
                minute = 0
                mainLabel.text = " 끝났으니 다시 선택하세요."
                timer?.invalidate()
                //AudioServicesPlayAlertSound(SystemSoundID(1322))
                
            }
            
               
           }
        
        
    
        //레이블과 슬라이더가 1초씩 줄어야한다.
        
        // 넘버가 0이되면 종이 울려야한다.
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
     setUp()
        
    }
    
}

