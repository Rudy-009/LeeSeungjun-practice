//
//  WelcomeViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 10/11/25.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var name: String? = nil
    let num: String = "🤍"
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo1")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "🤍 Home"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var calendar: UICalendarView = {
        let calendar = UICalendarView(frame: CGRect(x: 20, y: 400, width: 335, height: 300))
        calendar.fontDesign = .serif
        calendar.wantsDateDecorations = true
        calendar.availableDateRange = Calendar.current.dateInterval(of: .month, for: Date())!
        return calendar
    }()
    
    override func loadView() { super.loadView()
        print("\(num) 🍎 \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        print("\(num) 🍊 \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(true)
        print("\(num) 🍋 \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(true)
        print("\(num) 🍐 \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(true)
        print("\(num) 🍏 \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(true)
        print("\(num) 🫐 \(#function)")
    }
    
    deinit {
        print("\(num) 🍇 \(#function)")
    }
    
    
    private func setLayout() {
        [logoImageView, welcomeLabel, calendar].forEach {
            self.view.addSubview($0)
        }
    }
    
}

#Preview {
    HomeViewController()
}
