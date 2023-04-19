import SwiftUI

struct Learn: View {    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("What is Color ?")
                    .font(.system(size: 70))
                    .foregroundColor(.black)

                Spacer()
                    .frame(height: 20) 

                Text("Color is perception. Our eyes see something (the sky, for example), and data sent from our eyes to our brains tells us it’s a certain color (blue). Objects reflect light in different combinations of wavelengths. Our brains pick up on those wavelength combinations and translate them into the phenomenon we call color.")
                    .frame(width: geometry.size.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize))

                
                NavigationStack {
                    
                    NavigationLink(destination: Learn_Second()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                    }
                }
                
            }.frame(width: geometry.size.width, height: geometry.size.height)
                .background(Image("background").scaledToFill())
            
        }
    }
}

struct Learn_Second: View {    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("2 Types of Color")
                    .font(.system(size: 70))
                
                Spacer()
                    .frame(height: 20) 
                
                Text("There are 2 color modes, they are RGB and CMYK. RGB color mixing is the primary color mode for digital designs (like web, TV or phone files) while the CMYK mode is used for printed designs (like T-shirts, flyers or business cards)")
                    .frame(width: geometry.size.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .font(.system(size: 25))
                   .font(.system(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)

                
                HStack{
                    VStack{
                        Text("RGB")
                            .font(.system(size: 40))

                        Text("RGB is an additive process where light creates colors. In this mode, red, green and blue are the primary colors, and they combine to create a white light.")
//                            .font(.system(size: 20))
                            .font(.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize))
                            .multilineTextAlignment(.center)    
                            .fixedSize(horizontal: false, vertical: true)

                        
                        Image("rgb")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                    }
                    
                    VStack{
                        Text("CMYK")
                            .font(.system(size: 40))

                        Text("CMYK the opposite. In this mode, pigment creates the color and mixing is a subtractive process. Cyan, magenta and yellow are the primary colors, and they combine to create black. (Black is the “K” in “CMYK.”)")
//                            .font(.system(size: 20))
                            .font(.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)

                        
                        Image("cmyk")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                    }
                }.padding()
                    .foregroundColor(.black)

 
                
                NavigationStack {
                    
                    NavigationLink(destination: Learn_Third()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                    }

                }
                
            }.frame(width: geometry.size.width, height: geometry.size.height)
                 .background(Image("background"))   
                 .foregroundColor(.black)

        }        
    }
}


struct Learn_Third: View {    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("Color Fundementals For Mixing")
                    .font(.system(size: 70))
                
                Spacer()
                    .frame(height: 20) 
                
                Text("""
- Primary Color: Red, blue, and yellow are the only primary colors. All other colors are created through mixing primary colors in various combinations. Mixing any colors together will never create a primary color.

- Secondary Color: A color that is made when you mix two primary colors together—orange, green, and purple.

- Tertiary Color: Colors that are created by combining a secondary and a primary color (like yellow-green). 

- Complementary Colors: Colors that are opposites on a color wheel (like red and green). These have a significant contrast and can add depth and vibrancy to your paintings.

- Analogous Colors: Colors that sit next to each other on a color wheel e.g. (like yellow and green or purple and red).
""")
                    .frame(width: geometry.size.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      .font(.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize))                    .fixedSize(horizontal: false, vertical: true)
                
                NavigationStack {
                    
                    NavigationLink(destination: Learn_Final()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                    }
                    
                }
                
            }.frame(width: geometry.size.width, height: geometry.size.height)
                .background(Image("background"))   
                .foregroundColor(.black)
            
        }        
    }
}

struct Learn_Final: View {    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("You Just Learned About Color Mixing")
                    .font(.system(size: 70))
                    .multilineTextAlignment(.center)
                Text("Try it now Yourself!")
                    .font(.system(size: 70))
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationStack {
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Mix Now")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                    }                    
                    
                }    

                
            }.frame(width: geometry.size.width, height: geometry.size.height)
                .background(Image("background"))   
                .foregroundColor(.black)
        }        
    }
}
