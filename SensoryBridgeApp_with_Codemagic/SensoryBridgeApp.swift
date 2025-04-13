
import SwiftUI

@main
struct SensoryBridgeApp: App {
    @StateObject private var patientDataStore = PatientDataStore()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(patientDataStore)
        }
    }
}
