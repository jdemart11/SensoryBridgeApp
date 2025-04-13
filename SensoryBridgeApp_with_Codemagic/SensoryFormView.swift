
struct SensoryFormView: View {
    @EnvironmentObject var dataStore: PatientDataStore
    @State private var name = ""
    @State private var olfactory = ""
    @State private var gustatory = ""
    @State private var visual = ""
    @State private var auditory = ""
    @State private var tactile = ""
    @State private var proprioceptive = ""
    @State private var vestibular = ""
    @State private var showSuggestions = false
    var existingPatient: Patient? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(existingPatient == nil ? "Enter Patient Information" : "Edit Patient Information")
                    .font(.title)
                    .bold()

                TextField("Patient's name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Group {
                    TextField("Favorite smells (e.g., lavender, coffee)", text: $olfactory)
                    TextField("Favorite tastes (e.g., chocolate, lemon)", text: $gustatory)
                    TextField("Preferred visuals (e.g., beach, nature)", text: $visual)
                    TextField("Favorite sounds/music", text: $auditory)
                    TextField("Preferred textures (e.g., soft, smooth)", text: $tactile)
                    TextField("Proprioceptive input (e.g., hugs, stretching)", text: $proprioceptive)
                    TextField("Vestibular input (e.g., rocking, swinging)", text: $vestibular)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    let patient = Patient(id: existingPatient?.id ?? UUID(), name: name, olfactory: olfactory, gustatory: gustatory, visual: visual, auditory: auditory, tactile: tactile, proprioceptive: proprioceptive, vestibular: vestibular)
                    if existingPatient == nil {
                        dataStore.addPatient(patient)
                    } else {
                        dataStore.updatePatient(patient)
                    }
                    showSuggestions = true
                }) {
                    Text("Generate Intervention Ideas")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)

                NavigationLink(destination: SuggestionsView(olfactory: olfactory, gustatory: gustatory, visual: visual, auditory: auditory, tactile: tactile, proprioceptive: proprioceptive, vestibular: vestibular), isActive: $showSuggestions) {
                    EmptyView()
                }
            }
            .padding()
            .onAppear {
                if let patient = existingPatient {
                    name = patient.name
                    olfactory = patient.olfactory
                    gustatory = patient.gustatory
                    visual = patient.visual
                    auditory = patient.auditory
                    tactile = patient.tactile
                    proprioceptive = patient.proprioceptive
                    vestibular = patient.vestibular
                }
            }
        }
    }
}
