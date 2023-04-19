import SwiftUI
struct MixColor: View {
    @State private var shapes: [Shape] = []
    let colors: [Color] = [.black, .white, .red, .green, .blue, .yellow]
    @State private var showAlert = false
    @State private var showAlertForColor = false
    @State private var hex: String = ""


    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack{      
                HStack{
                    Text("Freely Mix Colors")
                        .font(.custom("SF-Pro-Display-Bold.otf", size: 50))
                        .bold()
                        .foregroundColor(.black)
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        HStack {
                            Image(systemName: "book.fill")
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                            
                            Text("How To Use?")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            
                        }.background(Color.blue)
                            .cornerRadius(10)
                        
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("How To Use?"), message: Text("""
            1. Double tap on the color below to create the color on canvas. 
            2. Then drag and drop the color on canvas to create new color. 
            3. Lastly, drag and drop to the trash icon to delete color from canvas.
            4. To view the color hex you have made, press the color.
            """), dismissButton: .default(Text("OK")))
                    }
                }


                
                ZStack {
                    ForEach(shapes) { shape in
                        shape
                            .onTapGesture {
                                showAlertForColor = true
                                 hex = shape.color.description
                            }.alert(isPresented: $showAlertForColor) {
                                Alert(title: Text("The Color Hex"), message: Text(hex), dismissButton: .default(Text("OK")))
                            }
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        let index = shapes.firstIndex(where: { $0.id == shape.id })!
                                        shapes[index].position = gesture.location
                                    }
                                    .onEnded { _ in
                                        checkCollisions(height: height, width: width)
                                    }
                            )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack{ 
                    
                    ForEach(colors, id: \.self) { color in
                        ZStack {
                            Circle()
                                .fill(color)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .onTapGesture(count: 2) {
                                    if shapes.count < 10 {
                                        let shape = Shape(position: CGPoint(x: 100*(shapes.count+1), y: 100), color: color)
                                        shapes.append(shape)
                                    }
                                }
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 101, height: 101)
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .scaledToFill()  
                    }.padding() 
                    
                }              
            }.background(Image("background"))  
        }
        
    }
    
    
    private func checkCollisions(height: CGFloat, width: CGFloat) {
        var newShapes = shapes
        var shapesToDelete: [Shape] = []
        var collidedShapes: Set<UUID> = []
        
        let height = height
        let width = width
        
        for i in 0..<newShapes.count {
            for j in i+1..<newShapes.count {
                let shape1 = newShapes[i]
                let shape2 = newShapes[j]
                let dx = shape1.position.x - shape2.position.x
                let dy = shape1.position.y - shape2.position.y
                let distance = sqrt(dx*dx + dy*dy)
                let combinedRadius = shape1.radius + shape2.radius
                
                if distance < combinedRadius && !collidedShapes.contains(shape1.id) && !collidedShapes.contains(shape2.id) {
                    // Combine colors and mark shapes for deletion
                    let newColor = shape1.color + shape2.color
                    let newPosition = CGPoint(x: (shape1.position.x + shape2.position.x) / 2, y: (shape1.position.y + shape2.position.y) / 2)
                    let newShape = Shape(position: newPosition, color: newColor)
                    shapesToDelete.append(shape1)
                    shapesToDelete.append(shape2)
                    newShapes.append(newShape)
                    collidedShapes.insert(shape1.id)
                    collidedShapes.insert(shape2.id)
                }
            }
        }
        
        for shape in newShapes {
            if shape.position.x > width-180 && shape.position.y > height-180 {
                shapesToDelete.append(shape)
            }
        }
        
        // Remove shapes that were marked for deletion
        for shapeToDelete in shapesToDelete {
            if let index = newShapes.firstIndex(where: { $0.id == shapeToDelete.id }) {
                newShapes.remove(at: index)
            }
        }
        
        shapes = newShapes
    }
}

struct Shape: View, Identifiable {
    var id = UUID()
    var position: CGPoint
    var color: Color
    let radius: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: radius * 2, height: radius * 2)
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: (radius + 2) * 2, height: (radius + 2) * 2)
        }
        .position(position)
    }
}

extension Color {
    static func +(color1: Color, color2: Color) -> Color {
        let uiColor1 = UIColor(color1)
        let uiColor2 = UIColor(color2)
        let cgColor1 = uiColor1.cgColor
        let cgColor2 = uiColor2.cgColor
        let components1 = cgColor1.components!.map { $0 * 255 }
        let components2 = cgColor2.components!.map { $0 * 255 }
        let red = (components1[0] + components2[0]) / 2 / 255
        let green = (components1[1] + components2[1]) / 2 / 255
        let blue = (components1[2] + components2[2]) / 2 / 255
        return Color(red: red, green: green, blue: blue)
    }
    
    init(rgb: UInt) {
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue)
    }
}
