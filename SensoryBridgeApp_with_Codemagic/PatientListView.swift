
struct PatientListView: View {
    @EnvironmentObject var dataStore: PatientDataStore
    @State private var searchText = ""

    var filteredPatients: [Patient] {
        if searchText.isEmpty {
            return dataStore.patients
        } else {
            return dataStore.patients.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        VStack {
            TextField("Search patients...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.horizontal, .top])

            List {
                ForEach(filteredPatients) { patient in
                    NavigationLink(destination: SensoryFormView(existingPatient: patient)) {
                        VStack(alignment: .leading) {
                            Text(patient.name)
                                .font(.headline)
                            Text("Auditory: \(patient.auditory), Visual: \(patient.visual)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let patient = filteredPatients[index]
                        dataStore.deletePatient(patient)
                    }
                }
            }
        }
        .navigationTitle("Saved Patients")
        .toolbar {
            EditButton()
        }
    }
}
