//
//  ViewController.swift
//  ios14
//
//  Created by EndoTakashi on 2016/05/05.
//  Copyright © 2016年 tak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        layer.lineWidth = 3.0
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 円形に描画するのでそのパスを生成
        let center = CGPoint(x: self.shapeLayer.bounds.size.width / 2.0, y: self.shapeLayer.bounds.size.height / 2.0) // 中心座標
        let radius = self.shapeLayer.bounds.size.width / 1.0  // 半径
        let startAngle = CGFloat(-M_PI_2)  // 開始点(真上)
        let endAngle = startAngle + 2.0 * CGFloat(M_PI)  // 終了点(開始点から一周)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        self.shapeLayer.path = path.CGPath
        
        self.view.layer.addSublayer(self.shapeLayer)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 画面の中心になるようにする
        self.shapeLayer.position = CGPoint(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.height / 2.0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // アニメーション開始
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.duration = 60.0
        anim.fromValue = 0.0
        anim.toValue = 1.0
        shapeLayer.addAnimation(anim, forKey: "circleAnim")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

