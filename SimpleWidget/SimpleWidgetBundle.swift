//
//  SimpleWidgetBundle.swift
//  SimpleWidget
//
//  Created by Issei Ueda on 2022/11/20.
//

import WidgetKit
import SwiftUI

@main
struct SimpleWidgetBundle: WidgetBundle {
    var body: some Widget {
        SimpleWidget()
        SimpleWidgetLiveActivity()
    }
}
