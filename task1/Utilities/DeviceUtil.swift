//
//  DeviceUtil.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import Foundation
import LocalAuthentication


class DeviceUtil {
    init() {}
    
    // MARK: - FaceID/TouchID
    
    func requestBiometricAuthentication() -> Bool {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Biometric authentication is available
            let reason = "Authenticate using biometrics"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        Data.shared.isLogin = true
                    } else {
                        // Authentication failed or user canceled
                        if let _ = error {
                            // Handle the error appropriately
                        }
                    }
                }
            }
        } else {
            // Biometric authentication is not available or not configured
            if let _ = error {
                // Handle the error appropriately
            }
        }
        
        return Data.shared.isLogin
    }

}
