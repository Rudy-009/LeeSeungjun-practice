//
//  SomeScrollView.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 10/18/25.
//

import UIKit
import SnapKit

class SomeScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var orangView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(337) // 187 : 337
            }
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            // 이게모게
            $0.height.greaterThanOrEqualToSuperview().priority(.low) // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints {
            $0.top.equalTo(contentView)
        }
        
        orangView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.trailing.equalTo(contentView)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangView.snp.bottom)
            $0.trailing.equalTo(contentView)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다. ⭐️
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다. ⭐️
        }

    }
}

// Scroll(유저에게 보여질 부분) > ContentView (크기가 고정되어 있음) > 여러 요소들

#Preview {
    SomeScrollViewController()
}
