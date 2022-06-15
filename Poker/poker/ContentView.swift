//
//  ContentView.swift
//  poker
//
//  Created by Jess Ryan on 11/14/21.
//

import SwiftUI

struct AppContentView: View {
    
    @State var signInSuccess = false
    @State var gameInProgress = false
    
    var body: some View {
        return Group {
            if signInSuccess {
                AppHome()
            }
            else {
                LoginFormView(signInSuccess: $signInSuccess)
            }
        }
    }
}

struct LoginFormView : View {
    
    @State public var userName: String = ""
    @State private var password: String = ""
    
    @State private var showError = false
    
    @Binding var signInSuccess: Bool
    
   
    
    let db = DBHelper()
    
    var body: some View {
        VStack {
            HStack {
                Text("User name")
                TextField("type here", text: $userName)
            }.padding()
            
            HStack {
                Text(" Password")
                TextField("type here", text: $password)
                    .textContentType(.password)
            }.padding()
            
            Button(action: {
                // Your auth logic
                if(self.userName == self.password) {
                    self.signInSuccess = true
                }
                else {
                    self.signInSuccess = true
                    //self.showError = true
                }
                self.db.insert(userName: userName, password: password)
                
            }) {
                Text("login")
            }
            
            if showError {
                Text("Incorrect username/password").foregroundColor(Color.red)
            }
        }
    }
}

struct AppHome: View {
    
    @State var gameInProgress = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Image")
                        .padding()
                    VStack{
                        Text("Ria")
                        Text("Level")
                            .padding()
                    }
                }
                
                Text("Recent Games:")
                    .padding()
                
                NavigationLink(destination: AppGamePlay() ) {
                    Text("play now!")
                }.simultaneousGesture(TapGesture().onEnded{
                    let g = game()
                    print("play now")
                })
                
            }
        }
    }
}

struct AppGamePlay: View {
    
    @State var potAmount = 0
    
    @State var first: Bool = false
    @State var second:Bool = false
    @State var third:Bool = false

    @State private var amount: String = ""

    var body: some View{
        
        ZStack {
            VStack{
                HStack{
                    var x = resizeImage(image: UIImage(imageLiteralResourceName: "4_of_diamonds"), targetSize: CGSize(width: 200, height: 200))
                    var a = resizeImage(image: UIImage(imageLiteralResourceName: "6_of_spades"), targetSize: CGSize(width: 200, height: 200))
                    var b = resizeImage(image: UIImage(imageLiteralResourceName: "ace_of_diamonds"), targetSize: CGSize(width: 200, height: 200))
                    var z = resizeImage(image: UIImage(imageLiteralResourceName: "queen_of_hearts"), targetSize: CGSize(width: 200, height: 200))
                    var h = resizeImage(image: UIImage(imageLiteralResourceName: "10_of_clubs"), targetSize: CGSize(width: 200, height: 200))
                    
                    
                    
                    
                    var y = resizeImage(image: UIImage(imageLiteralResourceName: "back"), targetSize: CGSize(width: 200, height: 200))
                    
                    Button(action: {
                        
                        first.toggle()
                    }) {
                        Image(uiImage: first == true ? x! : y!)
                    }
                    
                    Button(action: {
                        first.toggle()
                    }) {
                        Image(uiImage: first == true ? a! : y!)
                    }
                    
                    Button(action: {
                        first.toggle()
                    }) {
                        Image(uiImage: first == true ? b! : y!)
                    }
                    
                    
                }
                HStack{
                    var z = resizeImage(image: UIImage(imageLiteralResourceName: "queen_of_hearts"), targetSize: CGSize(width: 200, height: 200))
                    var h = resizeImage(image: UIImage(imageLiteralResourceName: "10_of_clubs"), targetSize: CGSize(width: 200, height: 200))
                    
                    
                    
                    
                    var y = resizeImage(image: UIImage(imageLiteralResourceName: "back"), targetSize: CGSize(width: 200, height: 200))
                    
                    Button(action: {
                        second.toggle()
                    }) {
                        Image(uiImage: second == true ? z! : y!)
                    }
                    
                    Button(action: {
                        third.toggle()
                    }) {
                        Image(uiImage: third == true ? h! : y!)
                    }
                    
                }
                
                Text("Pot amount:  \(potAmount)")
                    .padding()
                
                HStack{
                    Button(action: {
                        print("Button action")
                    }) {
                        Text("Check")
                    }
                    
                    Button(action: {
                        potAmount += Int(amount) ?? 0
                        print("Button action")
                    }) {
                        Text("Raise")
                    }
                    
                    Button(action: {
                        potAmount = 0
                        print("Button action")
                    }) {
                        Text("Fold")
                    }
                    
                }
                ZStack{
                    TextField("", text: $amount).background(Color(white: 255))
                }
                HStack{
                    var z = resizeImage(image: UIImage(imageLiteralResourceName: "ace_of_spades"), targetSize: CGSize(width: 100, height: 100))
                    var h = resizeImage(image: UIImage(imageLiteralResourceName: "king_of_hearts"), targetSize: CGSize(width: 100, height: 100))
                    
                    var y = resizeImage(image: UIImage(imageLiteralResourceName: "back"), targetSize: CGSize(width: 200, height: 200))
                    
                    
                        Image(uiImage: z!)
                   
                        Image(uiImage: h!)
                
                    
                
                }
            }
        }
        .background(
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
        
        
    }
    
    //https://www.advancedswift.com/resize-uiimage-no-stretching-swift/
    //this was really hard to get correct without making the image look crazy and stretched out so I had to get
    //this from a third party 
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
}

