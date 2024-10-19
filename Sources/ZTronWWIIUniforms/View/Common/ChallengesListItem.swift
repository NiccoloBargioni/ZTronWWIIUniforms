import SwiftUI

struct ChallengesListItem: View {
    let image: String
    let charcterName: String
    let setName: String
    
    init(image: String, charcterName: String, setName: String) {
        self.image = image
        self.charcterName = charcterName
        self.setName = setName
    }
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(charcterName.capitalized)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text(setName.capitalized)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}
