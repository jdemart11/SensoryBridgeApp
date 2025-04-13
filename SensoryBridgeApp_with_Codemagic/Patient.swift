
struct Patient: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var olfactory: String
    var gustatory: String
    var visual: String
    var auditory: String
    var tactile: String
    var proprioceptive: String
    var vestibular: String

    init(id: UUID = UUID(), name: String, olfactory: String, gustatory: String, visual: String, auditory: String, tactile: String, proprioceptive: String, vestibular: String) {
        self.id = id
        self.name = name
        self.olfactory = olfactory
        self.gustatory = gustatory
        self.visual = visual
        self.auditory = auditory
        self.tactile = tactile
        self.proprioceptive = proprioceptive
        self.vestibular = vestibular
    }
}

class PatientDataStore: ObservableObject {
    @Published var patients: [Patient] = []

    func addPatient(_ patient: Patient) {
        patients.append(patient)
    }

    func updatePatient(_ patient: Patient) {
        if let index = patients.firstIndex(where: { $0.id == patient.id }) {
            patients[index] = patient
        }
    }

    func deletePatient(_ patient: Patient) {
        patients.removeAll { $0.id == patient.id }
    }
}
