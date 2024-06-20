//
//  ViewController.swift
//  countApp
//
//  Created by 강유정 on 6/19/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var number: Int = 0
    let label = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    let resetButton = UIButton()
    
    // 뷰가 메모리에 올라왔을 때, 즉 이 ViewController가 생성이 되었을 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // UI를 세팅하는 메서드
    private func configureUI() {
        view.backgroundColor = .black    // 여기서 veiw는 ViewController의 뷰를 의미
        // label 속성 지정
        label.text = "\(number)"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        
        // 버튼의 속성
        minusButton.setTitle("감소", for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.backgroundColor = .red
        minusButton.layer.cornerRadius = 8    // 테두리 둥글게
        // 버튼의 액션
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        
        plusButton.setTitle("증가", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.backgroundColor = .blue
        plusButton.layer.cornerRadius = 8
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .gray
        resetButton.layer.cornerRadius = 8
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchDown)
        
        // 기본 뷰 위에 다른 뷰를 추가
        [label, minusButton, plusButton, resetButton]
            .forEach { view.addSubview($0) }
        
        // 제약 조건
        label.snp.makeConstraints {
            $0.width.equalTo(80)            // label의 넓이가 80과 같게
            $0.center.equalToSuperview()    // label의 부모 뷰와 center를 같게
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(30)
            $0.trailing.equalTo(label.snp.leading).offset(-32)
            // minusButton은 label로부터 32만큼 떨어지도록
            // offset은 항상 오른쪽, 위쪽은 양수 / 왼쪽, 아래쪽은  음수
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(30)
            $0.leading.equalTo(label.snp.trailing).offset(32)
        }
        
        resetButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(30)
            $0.top.equalTo(label.snp.bottom).offset(100)
            // resetButton의 top이 label의 bottom으로부터 100만큼 떨어지도록
        }
        
    }
    
    // #selector() 안에 넣기 위해서는 @objc 키워드 필요
    @objc
    private func minusButtonTapped() {
        self.number -= 1
        label.text = "\(number)"
    }
    
    @objc
    private func plusButtonTapped() {
        self.number += 1
        label.text = "\(number)"
    }
    
    @objc
    private func resetButtonTapped() {
        self.number = 0
        label.text = "\(number)"
    }
    
}

