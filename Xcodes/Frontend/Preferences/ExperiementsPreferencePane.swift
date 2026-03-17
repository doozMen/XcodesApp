import AppleAPI
import Path
import SwiftUI

struct ExperimentsPreferencePane: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            GroupBox(label: Text("ExtractionBackend")) {
                VStack(alignment: .leading) {
                    Picker("ExtractionBackendPicker", selection: $appState.extractionBackend) {
                        ForEach(ExtractionBackend.allCases) { backend in
                            Text(backend.displayName).tag(backend)
                        }
                    }
                    .pickerStyle(.radioGroup)
                    .disabled(appState.disableExtractionBackendChange)
                    Text("ExtractionBackendDescription")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .groupBoxStyle(PreferencesGroupBoxStyle())
        }
    }
}

struct ExperimentsPreferencePane_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExperimentsPreferencePane()
                .environmentObject(AppState())
                .frame(maxWidth: 600)
        }
    }
}
