import SwiftUI
import UIModule

@main
struct ServiceLocatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
