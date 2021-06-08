//
//  KetchumApp.swift
//  Ketchum
//
//  Created by Ryan Lee on 5/26/21.
//

import SwiftUI

@main
struct KetchumApp: App {
//    @StateObject private var order = Order()
    @StateObject private var userStore = UserStorage()
//    @EnvironmentObject var userStore: UserStorage

    var body: some Scene {
        WindowGroup {
            //ContentView()
//            HomeView()
            CompareSearchView().environmentObject(userStore)
        }
    }
}
