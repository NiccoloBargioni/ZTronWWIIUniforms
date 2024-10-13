import SwiftUI

public struct Hello: View {
    public var body: some View {
        VStack {
            Text("OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.ChallengeName".fromLocalized())
            Text("OUTFIT.B.A.T._AGENT.ON_ASSIGNMENT.SEASONED.ChallengeName", bundle: .module)
        }
    }
}
