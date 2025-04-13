
struct SuggestionsView: View {
    let olfactory: String
    let gustatory: String
    let visual: String
    let auditory: String
    let tactile: String
    let proprioceptive: String
    let vestibular: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Suggested Interventions")
                    .font(.title)
                    .bold()

                Text("- Play \(auditory) softly while offering \(olfactory) scent on a cloth.")
                Text("- Provide a small taste of \(gustatory) with a calming visual of \(visual).")
                Text("- Use \(tactile) materials while gently rocking or swinging.")
                Text("- Encourage proprioceptive input like \(proprioceptive) with supportive handling.")
                Text("- Combine \(vestibular) activity with calming music and \(olfactory) exposure.")
            }
            .padding()
        }
    }
}
