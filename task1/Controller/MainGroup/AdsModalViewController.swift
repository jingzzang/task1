//
//  AdsModalViewController.swift
//  task1
//
//  Created by 징 on 2023/05/13.
//

import UIKit

class AdsModalViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    init() {
        super.init(nibName: "AdsModal", bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func NoMoreTodayBtnClick(_ sender: UIButton) {
        Data.shared.showAds = false
        self.dismiss(animated: true)
    }
    
    @IBAction func CloseBtnClick(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}


extension AdsModalViewController: UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
              let toViewController = transitionContext.viewController(forKey: .to),
              let toView = toViewController.view else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
                
        if toViewController.isBeingPresented {
                    // Presenting animation
                    
            containerView.addSubview(toView)
            
            let finalFrame = transitionContext.finalFrame(for: toViewController)
            let halfHeight = containerView.frame.height / 2.0
            let initialFrame = CGRect(x: 0, y: containerView.frame.height, width: finalFrame.width, height: halfHeight)
            toView.frame = initialFrame
            
            UIView.animate(withDuration: 0.3, animations: {
                toView.frame = CGRect(x: 0, y: containerView.frame.height - halfHeight, width: finalFrame.width, height: halfHeight)
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        } else {
            // Dismissing animation
            UIView.animate(withDuration: 0.3, animations: {
                fromViewController.view.frame.origin.y = containerView.frame.height
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
