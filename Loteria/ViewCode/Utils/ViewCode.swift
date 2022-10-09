//
//  ViewCode.swift
//  ViewCode
//
//  Created by Anderson Alencar on 12/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

@objc protocol ViewCode {
    func buildHierarchy()
    func setUpConstraints()
    func additionalConfigurations()
}

extension ViewCode {
    func setUp() {
        buildHierarchy()
        setUpConstraints()
        additionalConfigurations?()
    }
    
    func additionalConfigurations() { }
}
