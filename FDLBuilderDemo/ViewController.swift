//
//  ViewController.swift
//  FDLBuilderDemo
//
//  Created by suguru-kishimoto on 2018/07/25.
//  Copyright © 2018年 suguru-kishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let builder = FDLBuilder(link: URL(string: "https://google.co.jp")!, domain: "fdlbuilderdemo.page.link")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        builder.build(.long) { url, _, _ in
            print("1", url as Any)
        }

        builder.build(.short) { (url, warnings, error) in
            print("2", url as Any, warnings as Any, error as Any)
        }
    }
}

