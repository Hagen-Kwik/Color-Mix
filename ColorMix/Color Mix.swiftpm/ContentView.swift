import SwiftUI

struct ContentView: View {

        var body: some View {
            NavigationStack {
                GeometryReader { geometry in
                    ZStack {
                        VStack{
                            Text("Color Mix")
                                .font(.custom("SF-Pro-Display-Bold.otf", size: 100))
                                .foregroundColor(.black)
                            
                            Text("Created By Hagen Kwik")
                                .font(.title2)
                                .foregroundColor(.black)
                            
                            NavigationLink(destination: MixColor()) {
                                Text("Mix Colors")
                                    .font(.title)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .frame(width: 400, height: 100, alignment: .center)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .font(Font.custom("MyFont", size: 18))
                            }
                            
                            NavigationLink(destination: Learn()) {
                                Text("Learn Color Thoery")
                                    .font(.title)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .frame(width: 400, height: 100, alignment: .center)
                                    .background(Color.orange)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Image("background").scaledToFill())
                }
            }.scaledToFill()
        }.navigationBarBackButtonHidden(true)
    }
}
