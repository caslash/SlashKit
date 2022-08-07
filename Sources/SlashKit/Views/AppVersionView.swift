//
//  AppVersionView.swift
//  SlashKit
//
//  Created by Cameron Slash on 20/7/22.
//

import SwiftUI

public struct AppVersionView: View {
    public var buildNum: String {
        if let text = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return text
        }
        return "0"
    }
    
    public var versionNum: String {
        if let text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return text
        }
        return "0"
    }
    public var body: some View {
        Text("v\(buildNum) build \(buildNum)")
    }
    public init() {}
}

public struct AppVersionView_Previews: PreviewProvider {
    public static var previews: some View {
        AppVersionView()
    }
}
