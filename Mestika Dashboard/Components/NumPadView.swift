//
//  NumPadView.swift
//  Mestika Dashboard
//
//  Created by Prima Jatnika on 26/10/20.
//

import SwiftUI

struct NumPadView: View {
    
    var value: String
    @Binding var password: String
    @Binding var key: String
    @Binding var unlocked: Bool
    @Binding var wrongPass: Bool
    
    @Binding var keyDeleteColor: Color
    
    var body: some View {
        Button(action: setPassword, label: {
            VStack{
                if value.count > 1{
                    Image(systemName: "delete.left.fill")
                        .font(.system(size: 24))
                        .foregroundColor(self.keyDeleteColor)
                        .frame(width: 60, height: 60)
                    
                } else {
                    Text(value)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color(hex: "#000000").opacity(0.6))
                        .clipShape(Circle())
                    
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        })
    }
    
    func setPassword(){
        withAnimation{
            if value.count > 1{
                
                if password.count != 0{
                    
                    password.removeLast()
                }
            }
            else{
                
                if password.count != 6{
                    
                    password.append(value)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        withAnimation{
                            
                            if password.count == 6{
                                print(password)
                                print(key)
                                if password == key{
                                    
                                    unlocked = true
                                    wrongPass = false
                                }
                                else{
                                    wrongPass = true
                                    password.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct NumPadView_Previews: PreviewProvider {
    static var previews: some View {
        NumPadView(value: "", password: .constant(""), key: .constant(""), unlocked: .constant(false), wrongPass: .constant(false), keyDeleteColor: .constant(Color.white))
    }
}
#endif
