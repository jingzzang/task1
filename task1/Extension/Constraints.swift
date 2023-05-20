//
//  Constraints.swift
//  task1
//
//  Created by 징 on 2023/05/19.
//

import UIKit

enum Equality {
    case less
    case more
    case same
}

struct Constraint {
    var view: UIView?
    var XAnchor: NSLayoutXAxisAnchor?
    var YAnchor: NSLayoutYAxisAnchor?
    var constant: CGFloat = 0
    var dConstant: CGFloat = 1
    
    init(_ view: UIView, _ XAnchor: NSLayoutXAxisAnchor, _ YAnchor: NSLayoutYAxisAnchor, _ constant: CGFloat, _ dConstant: CGFloat) {
        self.view = view
        self.XAnchor = XAnchor
        self.YAnchor = YAnchor
        self.constant = constant
        self.dConstant = dConstant
    }
    
    init(_ view: UIView) {
        self.view = view
    }
    
    init(_ view: UIView, constant: CGFloat) {
        self.view = view
        self.constant = constant
        self.dConstant = constant
    }
    
    init(_ XAnchor: NSLayoutXAxisAnchor) {
        self.XAnchor = XAnchor
    }
    
    init(_ YAnchor: NSLayoutYAxisAnchor) {
        self.YAnchor = YAnchor
    }
    
    init(_ XAnchor: NSLayoutXAxisAnchor, constant: CGFloat) {
        self.XAnchor = XAnchor
        self.constant = constant
        self.dConstant = constant
    }
    
    init(_ YAnchor: NSLayoutYAxisAnchor, constant: CGFloat) {
        self.YAnchor = YAnchor
        self.constant = constant
        self.dConstant = constant
    }
}

extension UIView {
    func setConstraints(top: Constraint? = nil, left: Constraint? = nil, bottom: Constraint? = nil, right: Constraint? = nil) {
        if let t = top {
            setTopConstraint(top: t)
        }
        
        if let l = left {
            setLeftConstraint(left: l)
        }
        
        if let b = bottom {
            setBottomConstraint(bottom: b)
        }
        
        if let r = right {
            setRightConstraint(right: r)
        }
    }
    
    func setConstraints(top: Constraint? = nil, left: Constraint? = nil, bottom: Constraint? = nil, right: Constraint? = nil, width: Constraint? = nil, height: Constraint? = nil) {
        if let t = top {
            setTopConstraint(top: t)
        }
        
        if let l = left {
            setLeftConstraint(left: l)
        }
        
        if let b = bottom {
            setBottomConstraint(bottom: b)
        }
        
        if let r = right {
            setRightConstraint(right: r)
        }
        
        setSizeConstraints(width: width, height: height)
    }
    
    func setConstraints(top: Constraint? = nil, left: Constraint? = nil, bottom: Constraint? = nil, right: Constraint? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        if let t = top {
            setTopConstraint(top: t)
        }
        
        if let l = left {
            setLeftConstraint(left: l)
        }
        
        if let b = bottom {
            setBottomConstraint(bottom: b)
        }
        
        if let r = right {
            setRightConstraint(right: r)
        }
        
        setSizeConstraints(width: width, height: height)
    }
    
    func setConstraintsCentrally(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, constant: CGFloat = 0) {
        if let t = top {
            setTopConstraint(top: Constraint(t, constant: constant))
        }
        
        if let l = left {
            setLeftConstraint(left: Constraint(l, constant: constant))
        }
        
        if let b = bottom {
            setBottomConstraint(bottom: Constraint(b, constant: -constant))
        }
        
        if let r = right {
            setRightConstraint(right: Constraint(r, constant: -constant))
        }
    }
    
    func setConstraintsRelatively(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, constant: CGFloat = 0) {
        if let t = top {
            setTopConstraint(top: Constraint(t, constant: constant))
        }
        
        if let l = left {
            setLeftConstraint(left: Constraint(l, constant: constant))
        }
        
        if let b = bottom {
            setBottomConstraint(bottom: Constraint(b, constant: constant))
        }
        
        if let r = right {
            setRightConstraint(right: Constraint(r, constant: constant))
        }
    }
    
    func setTopConstraint(top: Constraint) {
        if let view = top.view {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: top.constant)
            ])
        }else if let yAnchor = top.YAnchor {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: yAnchor, constant: top.constant)
            ])
        }
    }
    
    func setLeftConstraint(left: Constraint) {
        if let view = left.view {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left.constant)
            ])
        }else if let xAnchor = left.XAnchor {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: xAnchor, constant: left.constant)
            ])
        }
    }
    
    func setBottomConstraint(bottom: Constraint) {
        if let view = bottom.view {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom.constant)
            ])
        }else if let yAnchor = bottom.YAnchor {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: yAnchor, constant: bottom.constant)
            ])
        }
    }
    
    func setRightConstraint(right: Constraint) {
        if let view = right.view {
            NSLayoutConstraint.activate([
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right.constant)
            ])
        }else if let xAnchor = right.XAnchor {
            NSLayoutConstraint.activate([
                self.trailingAnchor.constraint(equalTo: xAnchor, constant: right.constant)
            ])
        }
    }
    // mark : 너비 & 높이
    
    /// 고정값
    func setSizeConstraints(width: CGFloat?, height: CGFloat?){
        if let wd = width {
            self.setWidthConstraint(width: wd)
        }
        
        if let ht = height {
            self.setHeightConstraint(height: ht)
        }
    }
    
    /// 상대값
    func setSizeConstraints(width: Constraint?, height: Constraint?){
        if let wd = width {
            self.setWidthConstraint(width: wd)
        }
        
        if let ht = height {
            self.setHeightConstraint(height: ht)
        }
    }
    
    // mark : 너비
    
    /// 고정값
    func setWidthConstraint(width: CGFloat, _ equality: Equality = .same){
        var constraint: NSLayoutConstraint {
            if equality == .less {
                return self.widthAnchor.constraint(lessThanOrEqualToConstant: width)
            }else if equality == .more {
                return self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
            }else {
                return self.widthAnchor.constraint(equalToConstant: width)
            }
        }
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 상대값
    func setWidthConstraint(width: Constraint) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: width.view!.widthAnchor, multiplier: width.dConstant)
        ])
    }
    
    // mark : 높이
    
    /// 고정값
    func setHeightConstraint(height: CGFloat, _ equality: Equality = .same){
        var constraint: NSLayoutConstraint {
            if equality == .less {
                return self.heightAnchor.constraint(lessThanOrEqualToConstant: height)
            }else if equality == .more {
                return self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
            }else {
                return self.heightAnchor.constraint(equalToConstant: height)
            }
        }
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 상대값
    func setHeightConstraint(height: Constraint) {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: height.view!.heightAnchor, multiplier: height.dConstant)
        ])
    }
    
    // mark : 가운데 정렬
    
    /// Horizontally & Vertically
    func setConstraintsCentrally(_ view: UIView, x: Bool = true, y: Bool = true) {
        if x {
            setConstraintsCentrallyX(view)
        }
        
        if y {
            setConstraintsCentrallyY(view)
        }
    }
    
    
    /// Horizontally
    func setConstraintsCentrallyX(_ view: UIView){
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    /// Vertically
    func setConstraintsCentrallyY(_ view: UIView){
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
