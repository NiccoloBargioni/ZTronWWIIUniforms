import SwiftUI

internal struct ChallengeBannerOutlineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.57224*width, y: 0.02857*height))
        path.addLine(to: CGPoint(x: 0.59343*width, y: 0.0057*height))
        path.addLine(to: CGPoint(x: 0.99895*width, y: 0.0057*height))
        path.addLine(to: CGPoint(x: 0.9656*width, y: 0.04256*height))
        path.addLine(to: CGPoint(x: 0.9656*width, y: 0.05145*height))
        path.addCurve(to: CGPoint(x: 0.9656*width, y: 0.31452*height), control1: CGPoint(x: 0.96363*width, y: 0.16317*height), control2: CGPoint(x: 0.96449*width, y: 0.25371*height))
        path.addCurve(to: CGPoint(x: 0.955*width, y: 0.60429*height), control1: CGPoint(x: 0.9686*width, y: 0.47938*height), control2: CGPoint(x: 0.9751*width, y: 0.52406*height))
        path.addCurve(to: CGPoint(x: 0.85964*width, y: 0.80636*height), control1: CGPoint(x: 0.94312*width, y: 0.65171*height), control2: CGPoint(x: 0.92299*width, y: 0.72854*height))
        path.addCurve(to: CGPoint(x: 0.66628*width, y: 0.94997*height), control1: CGPoint(x: 0.79015*width, y: 0.89172*height), control2: CGPoint(x: 0.70702*width, y: 0.93117*height))
        path.addCurve(to: CGPoint(x: 0.49994*width, y: 0.99953*height), control1: CGPoint(x: 0.60066*width, y: 0.98024*height), control2: CGPoint(x: 0.5412*width, y: 0.99335*height))
        path.addCurve(to: CGPoint(x: 0.23318*width, y: 0.89404*height), control1: CGPoint(x: 0.44286*width, y: 0.99196*height), control2: CGPoint(x: 0.33633*width, y: 0.96974*height))
        path.addCurve(to: CGPoint(x: 0.09365*width, y: 0.74251*height), control1: CGPoint(x: 0.14639*width, y: 0.83034*height), control2: CGPoint(x: 0.10337*width, y: 0.75913*height))
        path.addCurve(to: CGPoint(x: 0.03054*width, y: 0.54328*height), control1: CGPoint(x: 0.0496*width, y: 0.6672*height), control2: CGPoint(x: 0.03903*width, y: 0.60047*height))
        path.addCurve(to: CGPoint(x: 0.03345*width, y: 0.22533*height), control1: CGPoint(x: 0.01444*width, y: 0.43473*height), control2: CGPoint(x: 0.03203*width, y: 0.38877*height))
        path.addCurve(to: CGPoint(x: 0.02789*width, y: 0.04256*height), control1: CGPoint(x: 0.03414*width, y: 0.1469*height), control2: CGPoint(x: 0.03074*width, y: 0.08311*height))
        path.addCurve(to: CGPoint(x: 0.00093*width, y: 0.0057*height), control1: CGPoint(x: 0.0189*width, y: 0.03028*height), control2: CGPoint(x: 0.00991*width, y: 0.01799*height))
        path.addLine(to: CGPoint(x: 0.40667*width, y: 0.0057*height))
        path.addLine(to: CGPoint(x: 0.42389*width, y: 0.03239*height))
        path.addCurve(to: CGPoint(x: 0.506*width, y: 0.00061*height), control1: CGPoint(x: 0.42837*width, y: 0.02787*height), control2: CGPoint(x: 0.45901*width, y: -0.00194*height))
        path.addCurve(to: CGPoint(x: 0.57222*width, y: 0.02857*height), control1: CGPoint(x: 0.54234*width, y: 0.00259*height), control2: CGPoint(x: 0.56581*width, y: 0.0227*height))
        path.closeSubpath()
        return path
    }
}
