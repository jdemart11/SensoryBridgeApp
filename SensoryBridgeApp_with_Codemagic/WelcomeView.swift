
struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Welcome to Sensory Bridge")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("This app helps occupational therapists gather sensory preferences from family members to create meaningful stimulation interventions.")
                    .multilineTextAlignment(.center)
                NavigationLink(destination: SensoryFormView()) {
                    Text("Get Started")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: PatientListView()) {
                    Text("View Saved Patients")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
