import SwiftUI

struct InitialMenuOptionCell: View {
    let icon: String
    let title: String
    let onTap: () -> Void

    var body: some View {
        HStack {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            
            Spacer()
            
            Button {
                onTap()
            } label: {
                Image(systemName: "arrow.right")
                    .foregroundStyle(Color.primaryApp)
            }
        }
        .foregroundStyle(Color.primaryApp)
    }
}

#Preview {
    InitialMenuOptionCell(icon: "globe", title: "Idioma") {
        print("Tapped Idioma")
    }
}
