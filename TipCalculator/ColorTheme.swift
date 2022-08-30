//
//  ColorTheme.swift
//  TipCalculator
//
//  Created by Evelyn GAO on 8/29/22.
//

import Foundation

import UIKit

struct ColorTheme {

    // MARK: - Instance Vars

    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor

    let primaryColor: UIColor
    let primaryTextColor: UIColor

    let secondaryColor: UIColor

    let accentColor: UIColor
    let outputTextColor: UIColor

    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: .secondarySystemBackground,
                                  primaryColor: .white,
                                  primaryTextColor: .black,
                                  secondaryColor: .tintColor,
                                  accentColor: .systemPink,
                                  outputTextColor: .black)

    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .black,
                                 primaryColor: .darkGray,
                                 primaryTextColor: .white,
                                 secondaryColor: .darkGray,
                                 accentColor: .green,
                                 outputTextColor: .white)



}
