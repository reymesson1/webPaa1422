//
//  ProductZoom.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductZoom: View {
    let imagePlaceholder: String
    let loader: (@escaping (UIImage?) -> Void) -> Void

    @State private var image: UIImage?

    @State var isTapped: Bool = false
    @State var pointTapped : CGPoint = CGPoint.zero
    @State var draggedSize: CGSize = CGSize.zero
    @State var previousDragged : CGSize = CGSize.zero
  //  @GestureState var scale: CGFloat = 1.0
    @State var scale : CGFloat = 1.0


    
    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }

    var body: some View {
        
        GeometryReader{ reader in

                    Image(uiImage: imageToShow)
                    .resizable()
                    .scaleEffect(self.scale)
                    .scaledToFill()
                    .animation(.default)
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .offset(x:self.draggedSize.width,y:self.draggedSize.height)
                    .scaleEffect(self.isTapped ? 2:1, anchor: UnitPoint(x: self.pointTapped.x / reader.frame(in: .global).maxX , y: self.pointTapped.y / reader.frame(in: .global).maxY))
                        .gesture(TapGesture(count:2).onEnded({
                                                    self.isTapped = !self.isTapped
                                                }).simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global  ).onChanged({ (value) in
                                                    self.pointTapped = value.startLocation
                                                    self.draggedSize = CGSize(width: value.translation.width + self.previousDragged.width, height: value.translation.height + self.previousDragged.height)
                                                    print(value.startLocation)
                                                }).onEnded({ (value) in
                        
                                                    print(value.location)
                        
                                                    self.draggedSize = CGSize(width: value.translation.width+self.previousDragged.width, height: value.translation.height+self.previousDragged.height)
                        
                                                    self.previousDragged = self.draggedSize
                        
                                                })))
                    .gesture(MagnificationGesture().onChanged { value in
                            self.scale = value.magnitude
                        }
                    )
                    .onAppear {
                        loader {
                            self.image = $0
                        }
                    }
              }

    }
}

struct ProductZoom_Previews: PreviewProvider {
    static var previews: some View {
        ProductZoom(imagePlaceholder: "foodPlaceholder"){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
