//
//  ViewExtension.swift
//  task1
//
//  Created by 징 on 2023/05/17.
//

import UIKit

extension UIView {
    func showToast(msg: String) {
        let toast = ToastView(msg: msg)
        self.addSubview(toast)
        
        toast.translatesAutoresizingMaskIntoConstraints = false
        
        toast.setConstraintsCentrally(self)
        toast.setWidthConstraint(width: 250, .less)
        
        /*
         * withDuration : animations 동작 시간
         * delay : animations 시작 지연 시간
         * animations : 애니메이션 동작
         * completion : 애니메이션 Closure
         */
        UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveEaseInOut,
                       animations: {
                            toast.alpha = 0.0
                        }, completion:{ _ in
                            toast.removeFromSuperview()
                        })
        
        /*
         * Animation Options
         * curveEaseInOut: 처음에는 느리게 시작하고, 중간에 가속하며, 마지막에 다시 느려지는 이징 효과를 부여합니다.
         * curveEaseIn: 처음에는 느리게 시작하고, 점점 빨라지는 이징 효과를 부여합니다.
         * curveEaseOut: 처음에는 빨리 시작하고, 점점 느려지는 이징 효과를 부여합니다.
         * curveLinear: 애니메이션 동안 일정한 속도로 진행됩니다.
         * transitionFlipFromLeft: 좌측에서 화면이 뒤집어지는 전환 효과를 부여합니다.
         * transitionFlipFromRight: 우측에서 화면이 뒤집어지는 전환 효과를 부여합니다.
         * transitionCurlUp: 화면이 말린 종이처럼 위로 말려가는 전환 효과를 부여합니다.
         * transitionCurlDown: 화면이 말린 종이처럼 아래로 말려가는 전환 효과를 부여합니다.
         * transitionCrossDissolve: 페이드 인/아웃 효과를 부여합니다.
         */
    }
}
